<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/22/2018
 * Time: 8:21 PM
 */

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = "categories";

    public $timestamps = false;

    public function questions()
    {
        return $this->hasMany('App\Models\Question');
    }

    public function answers(){
    	return $this->hasMany('App\Models\Answers');
    }	
}