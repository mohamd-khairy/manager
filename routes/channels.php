<?php

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/
use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('App.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});
// Broadcast::channel('chat', function ($m) {
//     return true;
//   });

// Broadcast::channel('App.User.{id}', function ($user, $id) {
//     // return (int) $user->id === (int) $id;
//     return true;
// });
// Broadcast::channel('update_employee.{id}', function ($emp, $id) {
//     return (int) $emp->id === (int) $id;
// });

// Broadcast::channel('notification.*', function ($user) {
//     return true;
// });