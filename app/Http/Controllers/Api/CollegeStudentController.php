<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CollegeStudentController extends Controller
{
    //get all data using Query Builder
    public function Index()
    {
        //$collegeStudent = DB::table('student')->get();
        //return response()->json($collegeStudent);

        // Left Join using querybuilder
        //$collegeStudent = DB::table('student')
        //->leftJoin('department','student.DEPT_CODE','department.DEPT_CODE')
        //->leftJoin('professor','department.DEPT_CODE','professor.DEPT_CODE')
       // ->leftJoin('employee','professor.EMP_NUM','professor.EMP_NUM')
        //->select('student.STU_FNAME', 'student.STU_LNAME', 'department.DEPT_NAME', 'professor.EMP_NUM', 'employee.EMP_FNAME','employee.EMP_LNAME')
       //->get();
        //return response()->json($collegeStudent);

        //using Eloquent and model
        //$collegeStudent = Student::get();
        //return response()->json($collegeStudent);

        //query builder with models 
        $collegeStudent = Student::
        leftJoin('department','student.DEPT_CODE','department.DEPT_CODE')
        ->leftJoin('professor','department.DEPT_CODE','professor.DEPT_CODE')
        ->leftJoin('employee','professor.EMP_NUM','professor.EMP_NUM')
        ->select('student.STU_FNAME', 'student.STU_LNAME', 'department.DEPT_NAME', 'professor.EMP_NUM', 'employee.EMP_FNAME','employee.EMP_LNAME')
         ->get();
        return response()->json($collegeStudent);



    }

    //get student by id 
    public function StuEdit($id)
    {
        $collegeStudent = DB::table('student')
            ->where('STU_NUM', $id)
            ->get();
        return response()->json($collegeStudent);
    }

    public function ViewStudentProf($id)
    {
        // Left Join
        $collegeStudent = DB::table('student')
        ->leftJoin('department','student.DEPT_CODE','department.DEPT_CODE')
        ->leftJoin('professor','department.DEPT_CODE','professor.DEPT_CODE')
        ->leftJoin('employee','professor.EMP_NUM','professor.EMP_NUM')
        ->select('student.STU_FNAME', 'student.STU_LNAME', 'department.DEPT_NAME', 'professor.EMP_NUM', 'employee.EMP_FNAME','employee.EMP_LNAME')
        ->where('department.DEPT_NAME','Biology')
        ->where('professor.EMP_NUM', $id)
        ->get();
        return response()->json($collegeStudent);
    }

    //Eloquent
}
