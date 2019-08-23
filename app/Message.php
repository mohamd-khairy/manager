<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    // use Notifiable;

    public function user(){
        return $this->belongsTo('App\User');
    }
}
