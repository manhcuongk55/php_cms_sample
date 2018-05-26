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

Route::get('/home', 'HomeController@index');
Route::post('/survey-data', 'SurveyController@questions');
Route::post('/save', 'SurveyController@save');
Route::post('/results-data', 'SurveyController@results');

Auth::routes();

Route::get('/logout', '\App\Http\Controllers\Auth\LoginController@logout');

Route::prefix('manager')->group(function () {
    Route::get('/', '\App\Http\Controllers\Auth\LoginController@showLoginForm');
    Route::prefix('dashboard')->group(function (){
        Route::get('/', 'DashboardController@index')->name('index');
        Route::post('/summary', 'DashboardController@summaryChart')->name('summary');
        Route::post('/top10', 'DashboardController@top10Chart')->name('top10');
    });
    Route::prefix('topics')->group(function (){
        Route::get('/', 'TopicController@index')->name('index');
        Route::post('/listing', 'TopicController@listing')->name('listing');
        Route::post('/url', 'TopicController@url')->name('url');
        Route::get('/export', 'TopicController@export')->name('export');
    });

});

Route::get('/', 'SurveyController@index');
Route::get('/survey/{param?}', 'SurveyController@index');