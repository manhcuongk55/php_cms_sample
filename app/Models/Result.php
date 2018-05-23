<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/22/2018
 * Time: 10:21 PM
 */

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Result extends Model
{
    protected $table = 'results';
    public $timestamps = false;

    public function surveyor(){
        $this->belongsTo('App\Models\Surveyor','surveyor_id');
    }

    public function question(){
        $this->belongsTo('App\Models\Question','question_id');
    }

    public function answer(){
        $this->belongsTo('App\Models\Answers','answer');
    }
}