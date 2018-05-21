<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/{topic}-{surveyor}', "SurveyController@index");

Auth::routes();

Route::get('/logout', '\App\Http\Controllers\Auth\LoginController@logout');

Route::prefix('manager')->group(function () {
    Route::get('/', 'HomeController@index')->name('dashboard');

    Route::prefix('dashboard')->group(function (){
        Route::get('/', 'DashboardController@index')->name('index');
    });
    Route::prefix('topics')->group(function (){
        Route::get('/', 'TopicController@index')->name('index');
        Route::post('/listing', 'TopicController@listing')->name('listing');
        Route::post('/url', 'TopicController@url')->name('url');
    });

});

