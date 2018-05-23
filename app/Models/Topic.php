<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    protected $table = "topics";

    public $timestamps = false;


     public function surveyors(){
         return $this->hasMany('App\Models\Surveyor');
     }

    public static function get($id)
    {
        return Topic::where('id', $id)->first();
    }


    public static function getByCode($code){
        return Topic::where('code', $code)->first();
    }

    public static function listing($start = 0, $length = 10, $keyword = '', $orderBy = 'code', $orderType = 'asc', $isCounting = false)
    {
        $topic = Topic::withCount('surveyors')
            ->withCount(['surveyors as new' => function ($q) {
                $q->where('status', '=', 0);
            }])
            ->withCount(['surveyors as seen' => function ($q) {
                $q->where('status', '=', 1);
            }])
            ->withCount(['surveyors as done' => function ($q) {
                $q->where('status', '=', 2);
            }])
            ->where('code', 'LIKE', "%$keyword%")
            ->orWhere('manager', 'LIKE', "%$keyword%")
            ->skip($start)
            ->take($length);

        if ($isCounting) {
            return $topic->count();
        } else {
            return $topic->orderBy($orderBy, $orderType)->get();
        }
    }

}
