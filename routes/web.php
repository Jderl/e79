<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ServicesController;
// From Models User Php  [Eloquent Style]
use App\Models\User;  
use Illuminate\Support\Facades\Route;

// From Models User Php  [Query Builder Style]
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('home');
});
Route::get('/home', function () {
    return view('home');
});
Route::get('/contact-us', function () {
    return view('contact');
});
Route::get('/services-available-for-this-month-april-2024', [ServicesController::class, 'index'])->name('services');

// Route::get('/contact-us', function () {
//     return view('contact');
// })->middleware('check');

// Route::get('/services', function () {
//     return view('services');
// });

// Route::get('/services-available-for-this-month-april-2024', [ServicesController::class, 'index'])->name('services')->middleware('check');

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {

        // Eloquent ORM 
        //get all all content
        //$users=User::all();

        //Query Builder
        $users=DB::table('users')->get();
        return view('dashboard', compact('users'));
    })->name('dashboard');
});

Route::get('/category/all', [CategoryController::class, 'AllCat'])->name('all.category');
Route::post('/Category/add', [CategoryController::class, 'AddCat'])->name('store.category');
