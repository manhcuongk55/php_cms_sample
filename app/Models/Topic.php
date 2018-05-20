<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    protected $table = "topics";

    public static function get($id){
    	return Topic::where('id', $id)->first();
    }
}
