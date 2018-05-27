<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Surveyor extends Model
{
    protected $table = 'surveyors';
    public $timestamps = false;

    public function topic()
    {
        return $this->belongsTo('App\Models\Topic', 'topic_id');
    }

    public function results()
    {
        return $this->hasMany('App\Models\Result');
    }

    public static function get($id)
    {
        return Surveyor::where('id', $id)->first();
    }

    public static function renderUrl($id, $number)
    {
        if (is_nan($number) || $number == 0 || !isset($id)) {
            return false;
        }
        $arrInserts = [];
        $topic = Topic::find($id);
        $urlId = intval(Surveyor::max('id')) + 1;

        for ($i = 1; $i <= $number; $i++) {
            $arr = [
                'id' => $urlId,
                'url' => '/' . urlencode($topic->code . '-' . $urlId),
                'topic_id' => $id,
                'status' => 0
            ];
            $arrInserts[] = $arr;
            $urlId++;
        }

        $check = DB::table('surveyors')->insert($arrInserts);
        if ($check) {
            $topic->rendered = 1;
            return $topic->save();
        }
        return false;
    }

    public static function export($id)
    {
        $topic = Topic::find($id);
        if ($topic == null) {
            return null;
        }
        $surveyors = Surveyor::where('topic_id', $id)->get();
        $collection = collect($surveyors);
        $idSurveyors = $collection->map(function ($item, $key) {
            return $item->id;
        })->toArray();

        print_r($idSurveyors);
        die();

    }
}
