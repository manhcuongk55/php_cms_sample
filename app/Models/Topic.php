<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    protected $table = "topics";

    public $timestamps = false;

    public static function get($id){
    	return Topic::where('id', $id)->first();
    }

    public function urls()
    {
        return $this->hasMany('App\Models\Url');
    }

    public static function listing($start = 0, $length = 10, $keyword = '', $orderBy ='code', $orderType = 'asc', $isCounting = false){
        $topic = Topic::withCount('urls')
        ->where('code','LIKE',"%$keyword%")
        ->orWhere('manager','LIKE',"%$keyword%")
        ->skip($start)
        ->take($length);

        if($isCounting){
            return $topic->count();
        }else{
            return $topic->orderBy($orderBy, $orderType)->get();
        }

    }
}
