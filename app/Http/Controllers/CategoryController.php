<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Redis;

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

        //paganation query builder
        //$categories = DB::table("categories")
        // ->join('users', 'categories.user_id', 'users.id')
        // ->select('categories.*', 'users.name')
        // ->latest()->paginate(4);
        // return view("admin.category.index", compact("categories"));;


        //Edit and Delete eloquent
        $categories = Category::latest()->paginate(5);
        //get trashed item
        $trashes = Category::onlyTrashed()->latest()->paginate(3);
        return view("admin.category.index", compact("categories", "trashes"));;
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
        $data = array();
        $data['category_name'] = $request->category_name;
        $data['user_id'] = Auth::user()->id;
        $data['created_at'] = Carbon::now();
        DB::table('categories')->insert($data);

        //Validation
        //adds redirect and go back to the page with session
        return Redirect()->back()->with('success', 'Category inserted Successfully');
    }

    //Edit Categories routes Query Builder
    public function Edit($id)
    {
        $categories = DB::table('categories')->where('id', $id)->first();
        return view('admin.category.edit', compact('categories'));
    }

    //Update Function // Edit Query Builder
    public function Update(Request $request, $id)
    {
        $data = array();
        $data['category_name'] = $request->category_name;
        $data['user_id'] = Auth::user()->id;
        DB::table('categories')->where('id', $id)->update($data);
        return Redirect()->route('all.category')->with('success', 'Category Updated Successfully!');
    }

    // Trash  
    public function SoftDelete($id)
    {
        $delete = Category::find($id)->delete();
        return Redirect()->back()->with('success', 'Successfully move to trashed!');
    }

    // Restore 
    public function restore($id)
    {
        $deletedCategory = Category::withTrashed()->find($id);
        $deletedCategory->restore();
        return redirect()->back()->with('success', 'Successfully restored item!');
    }

    //Permanent Deleted
    public function Deleted($id)
    {
        $deletedCategory = Category::onlyTrashed()->find($id)->forceDelete();
        return Redirect()->back()->with('success', 'Permanently Deleted !');
    }
}
