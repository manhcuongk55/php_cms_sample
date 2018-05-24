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

    public function index($topicCode, $surveyorId){

    	$surveyor = Surveyor::get($surveyorId);
    	$topic = Topic::getByCode($topicCode);

    	if(!$topic || !$surveyor){
    		die('This survey does not exist.');
    	}

    	if($surveyor->topic()->first()->id != $topic->id){
    		die('This survey does not belong to the surveyor.');
    	}

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
