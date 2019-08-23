<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <table class="table table-bordered">
        <tbody>
                     <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>City</th>
                        <th>mobile</th>
                        <th>Added_By</th>
                        <th>Status</th>
                        <th>Photo</th>
                    </tr>
                    @foreach($emp as $key => $e)
                    <tr >
                        <td>{{$key+1}}</td>
                        <td>{{$e->name}}</td>
                        <td>{{$e->email}}</td>
                        <td>{{$e->city}}</td>
                        <td>{{$e->mobile}}</td>
                        <td>{{$e->user->name}}</td>
                        <td>{{$e->status}}</td>
                        <td>
                            <img src="./img/{{$e->photo}}" class="img-circle" style="width:45px;height:40px">
                        </td>
                     </tr>
                     @endforeach
        </tbody>
    </table>
  </body>
</html>