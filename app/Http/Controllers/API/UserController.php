<?php

namespace App\Http\Controllers\API;

use Intervention\Image\ImageManagerStatic as Image;
use App\Events\update_user;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Http\Resources\UserResource;
class UserController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    // public function getUserResource(){
    //     return new UserResource(auth()->user());
    // }
    
    public function index()
    {
        return User::where('id','!=',auth('api')->user()->id)->paginate(10);
    }

    public function updateProfile(Request $request)
    {
        $user = auth('api')->user();
        $this->validate($request,[
            'name' => 'required|string|max:191',
            'type' => 'required',
            'email' => 'required|string|email|max:191|unique:users,email,'.$user->id,
            'password' => 'sometimes|required|min:6'
        ]);

        $currentPhoto = $user->photo;

        if($request->photo != $currentPhoto){
            $name = time().'.' . explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];

            Image::make($request->photo)->save(public_path('./img/').$name);
            $request->merge(['photo' => $name]);

            $userPhoto = public_path('./img/').$currentPhoto;
            if(file_exists($userPhoto)){
                @unlink($userPhoto);
            }

        }

        if(!empty($request->password)){
            $request->merge(['password' => bcrypt($request['password'])]);
        }

        $user->update($request->all());
        return ['message' => "Success"];
    }
    
    public function profile()
    {
        return auth('api')->user();
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|string|max:191',
            'type' => 'required',
            'email' => 'required|string|email|max:191|unique:users',
            'password' => 'required|string|min:6'
        ]);

        $user= User::create([
            'name'=>$request->name,
            'email'=>$request->email,
            'bio'=>$request->bio,
            'type'=>$request->type,
            'password'=>bcrypt($request->password)
        ]);
        
        event(new update_user($user));

        return $user;
    }

    
    public function show($id)
    {
        return User::all();
    }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $this->validate($request,[
            'name' => 'required|string|max:191',
            'type' => 'required',
            'email' => 'required|string|email|max:191|unique:users,email,'.$user->id,
            'password' => 'sometimes|min:6'
        ]);

        if(!empty($request->password)){
            $request->merge(['password' => bcrypt($request['password'])]);
        }

        $user->update($request->all());

        event(new update_user($user));

        return ['message' => 'Updated the user info'];
        
    }


    public function destroy($id)
    {
        $this->authorize('isAdmin');
     //   if(\Gate::allows('isAdmin') || \Gate::allows('isAuthor')){
        // delete the user
        $user = User::findOrFail($id);
        $user->destroy($id);
        event(new update_user(user::first()));

        if($user->photo != 'avatar.png'){
        $userPhoto = public_path('./img/').$user->photo;
            if(file_exists($userPhoto)){
                @unlink($userPhoto);

            }
        }
        
        return ['message' => 'User Deleted'];
       // }
    }

    public function search(){
        if ($search = \Request::get('q')) {
            $users = User::where(function($query) use ($search){
                $query->where('name','LIKE',"%$search%")
                        ->orWhere('email','LIKE',"%$search%");
            })->paginate(20);
        }else{
            $users = User::latest()->paginate(10);
        }

        return $users;
    }
}
