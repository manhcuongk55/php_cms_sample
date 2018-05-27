<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/21/2018
 * Time: 6:54 PM
 */

namespace App\Http\Controllers;
use App\Models\Topic;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

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
        return \View::make('manager.dashboard.index')->with([
            'menu' => 'dashboard'
        ]);
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

    public function upload(Request $request){
        $path = $request->file('file')->store('upload');

        $fileName = url('/') . '/storage/' . $path;
        $myfile = fopen($fileName, "r") or die("Unable to open file!");
        echo fread($myfile,filesize($fileName));
        fclose($myfile);

    }
}