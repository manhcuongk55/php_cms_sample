<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/20/2018
 * Time: 30:21 PM
 */

namespace App\Http\Controllers;

use App\Models\Answers;
use App\Models\Category;
use App\Models\Surveyor;
use App\Models\Topic;
use Maatwebsite\Excel\Facades\Excel;
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

    public function export(Request $request){
        $id = $request->input('id');

        $cats = Category::with('questions')->get();
        $collection = collect($cats);
        $groupedCats = $collection->groupBy('page')->toArray();

        $answers = Answers::get();
        $collection = collect($answers);
        $groupedAnswers = $collection->groupBy('category_id')->toArray();

        Excel::create('Topic statistic', function($excel) use ($groupedCats, $groupedAnswers) {

            $excel->sheet('Detail', function($sheet) use ($groupedCats, $groupedAnswers) {
                $sheet->setWidth(array(
                    'A'     =>  5,
                    'B'     =>  30,
                    'C'     =>  30,
                    'D'     =>  30,
                    'E'     =>  30,
                    'F'     =>  30,
                    'G'     =>  30,
                    'H'     =>  30,
                    'I'     =>  30,
                    'J'     =>  30,
                ));
                $sheet->loadView('manager.topics.partitals.export-topic')
                ->with('categories', $groupedCats)
                ->with('answers', $groupedAnswers);
                $sheet->setOrientation('landscape');
            });

        })->export('xls');

    }
}