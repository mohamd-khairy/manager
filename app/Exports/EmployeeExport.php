<?php

namespace App\Exports;

use App\Employee;
use Maatwebsite\Excel\Concerns\FromCollection;

class EmployeeExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public $data;
    public function __construct($data){
        $this->data=$data;
    }
    public function collection()
    {
        if(empty($this->data)){
            return Employee::with("user")->get();
        }else{
            $e= explode(',', $this->data);
            return Employee::with("user")->find($e);
        }
    }
}

