<?php

use App\Http\Controllers\Api\SclassController;
use App\Http\Controllers\Api\SubjectController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
*/

//class route
//get data routes 
Route::get('/class', [SclassController::class,'Index']);
//input data routes
Route::post('/class/store', [SclassController::class,'Store']);
// edit data routes 
Route::get('/class/edit/{id}', [SclassController::class,'Edit']);
// update route
Route::post('/class/update/{id}', [SclassController::class,'Update']);
// delete route
Route::get('/class/delete/{id}', [SclassController::class,'Delete']);

//Subject route
//get data routes 
Route::get('/subject', [SubjectController::class,'Index']);
//input data routes
Route::post('/subject/store', [SubjectController::class,'Store']);
// edit data routes 
Route::get('/subject/edit/{id}', [SubjectController::class,'Edit']);
// update route
Route::post('/subject/update/{id}', [SubjectController::class,'Update']);
// delete route
Route::get('/subject/delete/{id}', [SubjectController::class,'Delete']);