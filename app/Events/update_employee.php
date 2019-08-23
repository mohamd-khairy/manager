<?php

namespace App\Events;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
Use Employee;

class update_employee implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
     public $emp;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($emp)
    {
        $this->emp=$emp;
        //
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel("update_employee");//Private
    }

    public function broadcastWith(){
        return [
            'id' =>$this->emp['id'],
            'name' =>$this->emp['name'],
            'email' =>$this->emp['email'],
            'city' =>$this->emp['city'],
            'status' =>$this->emp['status'],
            'photo' =>$this->emp['photo'],
            'mobile' =>$this->emp['mobile'],
            'user_id' =>$this->emp['user_id']
        ];
    }
}
