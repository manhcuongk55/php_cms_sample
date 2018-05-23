<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/21/2018
 * Time: 6:54 PM
 */

namespace App\Http\Controllers;


class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return \View::make('manager.dashboard.index');
    }
}