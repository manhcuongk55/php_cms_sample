<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/21/2018
 * Time: 6:54 PM
 */

namespace App\Http\Controllers;
use App\Models\Topic;

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


    public function summaryChart()
    {
        $data = Topic::getSummary();
        return response()->json($data);
    }

    public function top10Chart()
    {
        $data = Topic::getTop10();
        return response()->json($data);
    }
}