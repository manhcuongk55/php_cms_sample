<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Surveyor extends Model
{
    protected $table = 'Surveyors';

    public function topic(){
    	return $this->belongsTo('App\Models\Topic', 'topic_id');
    }

    public static function get($id){
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
                'url' => '/' . base64_encode('hash=' . substr(md5(openssl_random_pseudo_bytes(20)), -32) . '&topic=' . $topic->code . '&stt=' . $urlId),
                'topic_id' => $id,
                'status'=> 0
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
}