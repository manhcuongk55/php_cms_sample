<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Topic;
use App\Models\Surveyor;

class SurveyController extends Controller
{
	public function __construct(Request $request){
		
	}	

    public function index($topicCode, $surveyorId){

    	$surveyor = Surveyor::get($surveyorId);
    	$topic = Topic::get($topicId);

    	if(!$topic || !$surveyor){
    		die('This survey does not exist.');
    	}

    	if($surveyor->topic()->first()->id != $topicId){
    		die('This survey does not belong to the surveyor.');
    	}

    	echo 'Welcome to this survey';
    }
}
