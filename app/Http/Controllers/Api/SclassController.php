<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Sclass;

class SclassController extends Controller
{
    //get data using eloquent ORM 
    public function Index()
    {
        $sclass = Sclass::latest()->get();
        return response()->json($sclass);
    }

    //for insert data 
    public function Store(Request $request)
    {
        // Validate data
        $validatedData = $request->validate([
            'class_name' => 'required|unique:sclasses|max:25',
        ]);

        // Insert data using ORM
        Sclass::create([
            'class_name' => $request->class_name,
        ]);

        // Return response
        return response('Student class inserted successfully');
    }

    //for edit get data by id 
    public function Edit($id)
    {
        $sclass = Sclass::findOrFail($id);
        return response()->json($sclass);
    }

    //for update data 
    public function Update(Request $request, $id)
    {
        Sclass::findOrFail($id)->update([
            'class_name' => $request->class_name,
        ]);
        return response('Student class Updated successfully');
    }

    //for delete get data by id 
     public function Delete($id)
    {
        $sclass = Sclass::findOrFail($id)->delete();
        return response("Student Class Deleted");
    }

}
