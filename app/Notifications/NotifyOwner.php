<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use App\Employee;
use App\User;

class NotifyOwner extends Notification
{
    use Queueable;
    public $emp;
    public $type;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct( $emp,$type)
    {
        $this->emp=$emp;
        $this->type=$type;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database','broadcast'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toDatabase($notifiable)
    {
        return [
            'emp'=>$this->emp,
            'type' => $this->type,
        ];
    }

    public function toBroadcast($notifiable)
    {
        return [
            'data'=>[
                 'emp'=>$this->emp,
                 'type' => $this->type,
            ]
           
        ];
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
