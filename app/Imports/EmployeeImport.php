<?php

namespace App\Imports;

use App\Employee;
use Maatwebsite\Excel\Concerns\ToModel;

class EmployeeImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Employee([
            'name'     => $row[1],
            'mobile'    => $row[2], 
            'city'    => $row[3], 
            'photo'    => 'avatar.png', 
            'email'    => $row[5], 
            'status'    => $row[6], 
            'user_id' => $row[7]
        ]);
    }
}
