<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/21/2018
 * Time: 6:54 PM
 */

namespace App\Http\Controllers;
use App\Models\Topic;
use App\Models\Surveyor;
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

        $fileName = 'storage/' . $path;
        return $fileName;
    }

    public function save(Request $request){
        $fileName = $request->input('file');

        if(!$fileName){
            return response([], 500);
        }

        Excel::load($fileName, function($reader) {
            $results = $reader->get();


            if(empty($results)){
                return;
            }

            $urlId = intval(Surveyor::max('id')) + 1;
            $data = [];
            foreach($results as $item){
                $tp = Topic::where('code', $item->ma_de_tai)->first();
                $sv = new Surveyor();
                if($tp){
                    $sv->topic_id = $tp->id;
                    $sv->url = '/' . urlencode($tp->code . '-' . $urlId);
                    $sv->status = 0;
                    $urlId++;
                    $sv->save();
                }

                $data[] = [$item->email_nguoi_khao_sat, $item->ma_de_tai, $sv->url];
            }

            $excel = new Excel();

            Excel::create('Danh sách url', function($excel) use ($data) {

                $excel->sheet('Sheetname', function($sheet) use ($data){

                    $sheet->fromArray($data);

                });

            })->export('xls');

            return response(['message' => 'success']);
        });

        return response([], 500);
    }
}