<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    //calls admin/category/index page 
    public function AllCat()
    {
        //get all
        //$categories = Category::all();

        //lastest query builder
        //$categories = DB::table("categories")->latest()->get();
        //return view("admin.category.index",compact("categories"));

        //paganation eloquent
        //$categories = Category::latest()->paginate(4);
        //return view("admin.category.index", compact("categories"));;

        //query builder
        $categories = DB::table("categories")
            ->join('users','categories.user_id','users.id')
            ->select('categories.*','users.name')
            ->latest()->paginate(4);
        return view("admin.category.index", compact("categories"));;

    }


    //add category

    public function addCat(Request $request)
    {
        //$validatedData = $request->validate([
        //  'category_name' => 'required|string|max:255',
        // ]);



        // costomized validation
        $validatedData = $request->validate(
            [
                'category_name' => 'required|unique:categories|max:15',
            ],
            [
                'category_name.required' => 'Please Enter Category name',
                'category_name.max' => 'Maximun chracter is 15',
                'category_name.unique' => 'Category name already exists',
            ],

        );
        //Eloquent Insertion
        //Category::insert([
            //'Category_name' => $request->category_name,
            //'user_id' => Auth::user()->id,
           // 'created_at' => Carbon::now(),
        //]);

        //$category = new Category;
        //$category -> category_name= $request->category_name;
        //$category -> user_id=Auth::user()->id;
        //created at
        //$category -> save();

        //QueryBuilder Insertion
        $data=array();  
        $data['category_name']=$request->category_name;
        $data['user_id']=Auth::user()->id;
        $data['created_at'] = Carbon::now();
        DB::table('categories')->insert($data);

        //Validation
        //adds redirect and go back to the page with session
        return Redirect()->back()->with('success', 'Category inserted Successfully');
    }
}
