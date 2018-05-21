<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/20/2018
 * Time: 10:21 PM
 */

namespace App\Http\Controllers;

use App\Models\Surveyor;
use App\Models\Topic;
use Illuminate\Http\Request;

class TopicController extends Controller
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
        return \View::make('manager.topics.index');
    }

    public function listing(Request $request)
    {
        $draw = $request->input('draw');
        $start = $request->input('start');
        $length = $request->input('length');

        $search = $request->input('search');
        $keyword = $search['value'] != null ? $search['value'] : "";

        $order = $request->input('order');
        $columns = $request->input('columns');
        $orderBy = $columns[$order[0]['column']]['data'];
        $orderType = $order[0]['dir'];

        $total = Topic::listing($start, $length, $keyword, $orderBy, $orderType, true);
        $results = Topic::listing($start, $length, $keyword, $orderBy, $orderType, false);

        return response()->json([
            'data' => $results,
            "recordsTotal" => $total,
            "recordsFiltered" => count($results),
        ]);
    }

    public function url(Request $request)
    {

        $id = $request->input('id');
        $number = $request->input('number');
        $results = Surveyor::renderUrl($id, $number);

        return response()->json([
            'code' => $results == true ? 1 : 0
        ]);
    }
}