<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Topic;
use App\Models\Surveyor;
use App\Models\Category;
use App\Models\Result;

class SurveyController extends Controller
{
	public function __construct(Request $request){
		
	}	

    public function index($param = ''){
        if(!$param){
            return \View::make('message')->with([
                'message' => 'Vui lòng nhập đúng địa chỉ url của khảo sát để bắt đầu thực hiện'
            ]);
        }

        $param = urldecode($param);

        //Parse topicCode and surveyorId
        $num = 0;
        for($i=strlen($param)-1; $i>=0; $i--){
            $c = $param[$i];
            if($c=='-'){
                $num = $i;
                break;
            }
        }
        $topicCode = substr($param, 0, $num);
        $surveyorId = substr($param, $num+1);

    	//Validate relation between surveyor and topic
        $surveyor = Surveyor::get($surveyorId);
    	$topic = Topic::getByCode($topicCode);

    	if(!$topic || !$surveyor){
    		return \View::make('message')->with([
                'message' => 'Địa chỉ khảo sát này không tồn tại'
            ]);
    	}

    	if($surveyor->topic()->first()->id != $topic->id){
    		return \View::make('message')->with([
                'message' => 'Địa chỉ khảo sát này không tồn tại'
            ]);
    	}

        //Return view
    	return \View::make('index')->with([
            'topic' => json_encode($topic),
            'surveyorId' => $surveyorId,
            'surveyor' => json_encode($surveyor)
        ]);
    }

    public function questions(Request $request){
        $page = $request->input('page');
        $surveyorId = $request->input('surveyorId');

        $sur = Surveyor::where('id', $surveyorId)->first();
        $sur->status = $sur->status==2 ? 2 : 1; //Seen;
        $sur->save();

        $cats = Category::where('page', $page)
                        ->with(['questions', 'answers'])
                        ->orderBy('index', 'asc')
                        ->get();

        return response(['data' => $cats]);
    }

    public function save(Request $request){
        $results = $request->input('results');
        $surveyorId = $request->input('surveyorId');

        if(!$surveyorId || empty($results)){
            return response(['message' => 'failure'], 500);
        }

        foreach ($results as $r) {
            $re = new Result();
            $re->surveyor_id = $surveyorId;
            $re->question_id = $r['question'];
            $re->answer = $r['answer'];
            $re->save();
        }

        $sur = Surveyor::where('id', $surveyorId)->first();
        $sur->status = 2; //Done;
        $sur->save();

        return response(['message' => 'success']);
    }

    public function results(Request $request){
        $surveyorId = $request->input('surveyorId');

        $res = Result::where('surveyor_id', $surveyorId)->get();

        return response(['data' => $res]);
    }
}
