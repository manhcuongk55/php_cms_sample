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
use App\Models\Result;
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
        return \View::make('manager.topics.index')->with([
            'menu' => 'topics'
        ]);
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
            "recordsFiltered" => $total,
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

    public function export(Request $request)
    {
        $id = $request->input('id');
        $all = false;
        if ($id) {
            $topic = Topic::find($id);
        } else {
            $topic = Topic::where('rendered', 1)->get()->toArray();
            $collection = collect($topic);

            $topicId = $collection->map(function ($item, $key) {
                return $item['id'];
            });
            $all = true;
        }
        $cats = Category::with('questions')->orderBy('page','asc')->get();
        $collection = collect($cats);
        $groupedCats = $collection->groupBy('page')->toArray();

        $answers = Answers::get();
        $collection = collect($answers);
        $groupedAnswers = $collection->groupBy('category_id')->toArray();

        $arrAnswers = $answers->toArray();
        if ($all) {
            $surveyors = Surveyor::with('results')->whereIn('topic_id', $topicId)->get()->toArray();
        } else {
            $surveyors = Surveyor::with('results')->where('topic_id', $id)->get()->toArray();
        }

        Excel::create('Topic statistic', function ($excel) use ($groupedCats, $groupedAnswers, $surveyors, $arrAnswers, $topic, $all) {
            if ($all) {
                $excel->sheet('General', function ($sheet) use ($groupedCats, $groupedAnswers, $surveyors, $arrAnswers, $topic) {
                    $sheet->loadView('manager.topics.partitals.export-all-topic')
                        ->with('categories', $groupedCats)
                        ->with('answers', $groupedAnswers)
                        ->with('surveyors', $surveyors)
                        ->with('mapAnswers', $arrAnswers)
                        ->with('topics', $topic);
                    $sheet->setOrientation('landscape');
                });
            } else {
                $excel->sheet('Detail', function ($sheet) use ($groupedCats, $groupedAnswers, $surveyors, $arrAnswers, $topic) {
                    $sheet->loadView('manager.topics.partitals.export-topic')
                        ->with('categories', $groupedCats)
                        ->with('answers', $groupedAnswers)
                        ->with('surveyors', $surveyors)
                        ->with('mapAnswers', $arrAnswers)
                        ->with('topic', $topic);
                    $sheet->setOrientation('landscape');
                });
            }

        })->export('xls');

    }
}