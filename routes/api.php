<?php

use Illuminate\Http\Request;

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::apiResources([
    'user' => 'API\UserController'
]);
Route::apiResources([
    'employee' => 'API\EmployeesController'
]);
Route::apiResources([
    'chat' => 'API\ChatController'
]);

// Route::get('get_user_resource' , 'API\UserController@getUserResource');

Route::delete('emp/deleteAll/{e}' , 'API\EmployeesController@DeleteAll');

Route::post('getNoti' , 'API\EmployeesController@getNoti');
Route::post('notify/read' , 'API\EmployeesController@NotiRead');

Route::get('profile' , 'API\UserController@profile');
Route::get('findUser', 'API\UserController@search');
Route::put('profile', 'API\UserController@updateProfile');

Route::get('email-test/{e}/{t}', function($e,$t){
	$details['text'] = $t;
	$details['email'] = $e;
  
    dispatch(new App\Jobs\SendEmailJob($details));
    return redirect("/employes");
});


// Route::post('email-test' ,'API\EmployeesController@sendEmaiL_action');
// Route::get('pdfEmp' , 'API\EmployeesController@CreatePDF');
// Route::get('WordEmp' , 'API\EmployeesController@CreateWORD');
// Route::get('export/excel' , 'API\EmployeesController@exportExcel');
// Route::post('import/excel' , 'API\EmployeesController@importExcel');

use App\Exports\EmployeeExport;
use App\Imports\EmployeeImport;
Route::get('export/excel/{e}' , function($e){
    
    return Excel::download(new EmployeeExport($e), 'employees.xlsx');
});
Route::post('import/excel' , function(Request $request){
    $file =$request->file_excel->getClientOriginalName();
        $filePath =$request->file_excel->getRealPath();
        $extension = pathinfo($file, PATHINFO_EXTENSION);
        if($extension === 'xlsx'){
             Excel::import(new EmployeeImport, $filePath);        
        }
            return redirect('/employes');  
});
Route::get('pdfEmp/{e}' , function($e){
    if(empty($e)){
        $emp = App\Employee::with("user")->get();
    }else{
        $e= explode(',', $e);
        $emp = App\Employee::with("user")->find($e);
    }
            
     $pdf = PDF::loadView('Pdf-File', compact('emp'));
      return $pdf->download('invoice.pdf');
});
Route::get('WordEmp/{e}' , function($e){
    if(empty($e)){
        $employees = App\Employee::with("user")->get();
    }else{
        $e= explode(',', $e);
        $employees = App\Employee::with("user")->find($e);
    }
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
});
