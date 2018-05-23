<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Surveyor extends Model
{
    protected $table = 'surveyors';

    public function topic(){
    	return $this->belongsTo('App\Models\Topic', 'topic_id');
    }

    public static function get($id){
    	return Surveyor::where('id', $id)->first();
    }
}
