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

        // die($start);

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
            ->orWhere('manager', 'LIKE', "%$keyword%");

        if ($isCounting) {
            return $topic->count();
        } else {
            return $topic->limit($length)->offset($start)->orderBy($orderBy, $orderType)->get();
        }
    }

    public static function getSummary()
    {
        $done = Topic::where('rendered', 1)->count();
        $new = Topic::where('rendered', 0)->count();
        return [
            'done' => $done,
            'new' => $new
        ];
    }

    public static function getTop10()
    {
        $data = Topic::where('rendered', 1)
            ->withCount('surveyors as surveyors_count')
            ->withCount(['surveyors as new' => function ($q) {
                $q->where('status', '=', 0);
            }])
            ->withCount(['surveyors as seen' => function ($q) {
                $q->where('status', '=', 1);
            }])
            ->withCount(['surveyors as done' => function ($q) {
                $q->where('status', '=', 2);
            }])
            ->orderBy('surveyors_count', 'desc')
            ->limit(10)
            ->offset(0)
            ->get();
        return [
            'data' => $data
        ];

    }
}
