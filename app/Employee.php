<?php

namespace App;
use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use Notifiable;
    
    protected $table='employees';

    protected $fillable = [
        'name', 'email', 'city','mobile','photo','status','user_id'
    ];

    protected $hidden = [
        'created_at', 'updated_at',
    ];

    public function user(){
        return $this->belongsTo('App\User');
    }
}
