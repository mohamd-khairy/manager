<?php

namespace App\Http\Controllers\API;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Employee;
use App\User;
use App\Events\update_employee;
use Excel;
use PDF;
use Auth;
use App\Notification;
use App\Exports\EmployeeExport;
use App\Imports\EmployeeImport;
use App\Notifications\NotifyOwner;
class EmployeesController extends Controller
{
    
    public function __construct(){

        $this->middleware('auth:api');
    }

    public function index()
    {
        return Employee::with("user")->paginate(10);

    }
    public function getNoti(){
        $n= Auth::user()->unreadNotifications;
         return $n;
    }
    public function NotiRead(Request $request){
        Auth::user()->unreadNotifications()->find($request->id)->markAsRead();
        return $request->type;
    }

    public function store(Request $request)
    {
        $name="avatar.png";
        $this->validate($request,[
            'name'=>'required|string|max:191',
            'email'=>'required|string|email|max:191|unique:employees',
            'mobile'=>'required|size:11|unique:employees',
            'city'=>'required',
            'status'=>'required',
            'photo'=>'required',
        ]);
        if(isset($request->photo)){
            $name=time().rand(0,10000).'.'.explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];
            Image::make($request->photo)->save(public_path('./img/').$name);
        }
        $emp=Employee::create([
            'name'=>$request->name,
            'email'=>$request->email,
            'mobile'=>$request->mobile,
            'status'=>$request->status,
            'user_id'=>auth('api')->user()->id,
            'photo'=>$name,
            'city'=>$request->city
        ]);
        Auth::user()->notify(new NotifyOwner($emp ,'employee'));
        event(new update_employee($emp));
        return $emp;
    }

    public function update(Request $request, $id)
    {
        $empData=Employee::findOrFail($id);
        $this->validate($request,[
            'name'=>'required|string|max:191',
            'email'=>'required|string|email|max:191|unique:employees,email,'.$empData->id,
            'mobile'=>'required|size:11|unique:employees,mobile,'.$empData->id,
            'city'=>'required',
            'status'=>'required',
            'photo'=>'sometimes',
        ]);
        
        $currentPhoto = $empData->photo;

        if($request->photo != $currentPhoto){
            $name=time().rand(0,10000).'.'.explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];
            Image::make($request->photo)->save(public_path('./img/').$name);
            
            $request->merge(['photo' => $name]);

            $userPhoto = public_path('./img/').$currentPhoto;
            if(file_exists($userPhoto)){
                if($userPhoto != 'avatar.png'){
                @unlink($userPhoto);
                }
            }
        }
         $empData=$empData->update($request->all());
         event(new update_employee($empData));

        return ['message' => "Success"];
    }

    public function destroy($id)
    {
        $emp=Employee::findOrFail($id);
        $emp->delete();
        event(new update_employee(Employee::first()));

        if($emp->photo != 'avatar.png'){
        $userPhoto = public_path('./img/').$emp->photo;
            if(file_exists($userPhoto)){
                    @unlink($userPhoto);
            }
        }
            return ['message' => 'Employe Deleted'];
    }

    
    public function DeleteAll($ids)
    {
         if(!empty($ids)){
         $e= explode(',', $ids);        
         $emp=Employee::find($e);
        foreach($emp as $item){
            if($item->photo != 'avatar.png'){
                $userPhoto = public_path('./img/').$item->photo;
                    if(file_exists($userPhoto)){
                            @unlink($userPhoto);
                             $item->delete();
                    }
               }
        }
         event(new update_employee(Employee::first()));
        
         return ['message' => 'Employees Deleted'];
        }
    }

    public function exportExcel(){
      
         return Excel::download(new EmployeeExport, 'employees.xlsx');
    }

    public function importExcel(Request $request) 
    {
        $file =$request->file_excel->getClientOriginalName();
        $filePath =$request->file_excel->getRealPath();
        $extension = pathinfo($file, PATHINFO_EXTENSION);
        if($extension === 'xlsx'){
             Excel::import(new EmployeeImport, $filePath);        
        }
            return redirect('/employes');   
    }

    public function CreatePDF(){
            $emp = Employee::with("user")->get();

            $pdf = PDF::loadView('Pdf-File', compact('emp'));
            return $pdf->download('invoice.pdf');
    }

    public function CreateWORD(){
        $employees = Employee::with("user")->get();

        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        $section = $phpWord->addSection();
        $text = $section->addText("#| Name | Email | City | Mobile | Status | Added By ",array('name'=>'Arial','size' => 15,'bold' => true));
        foreach($employees as $key=>$emp){
        
            $text = $section->addText($key+1 ." | ".$emp->name." | ".$emp->email." | ".$emp->city." | ".$emp->mobile
            ." | ".$emp->status." | ".$emp->user->name);
        
        }
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
        $objWriter->save('Appdividend.docx');
        return response()->download(public_path('Appdividend.docx'));
    }
    
//    public function sendEmaiL_action(Request $request){    
//        $details=['email'=> $request->email , 'text' => $request->text ];   
//        $job=(new App\Jobs\SendEmailJob($details))->delay(now()->addSeconds(3));
//        dispatch($job);
//        return 'email_sent';//redirect("/employes");
//   }
}
