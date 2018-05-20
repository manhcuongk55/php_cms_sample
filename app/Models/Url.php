<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/20/2018
 * Time: 6:32 PM
 */

namespace App\Models;

use App\Models\Topic;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Url extends Model
{
    protected $table = "urls";

    public static function renderUrl($id, $number)
    {
        if (is_nan($number) || $number == 0 || !isset($id)) {
            return false;
        }
        $arrInserts = [];
        $topic = Topic::find($id);
        $urlId = intval(Url::max('id')) + 1;

        for ($i = 1; $i <= $number; $i++) {
            $arr = [
                'id' => $urlId,
                'url' => '/' . base64_encode('hash=' . substr(md5(openssl_random_pseudo_bytes(20)), -32) . '&topic=' . $topic->code . '&stt=' . $urlId),
                'topic_id' => $id
            ];
            $arrInserts[] = $arr;
            $urlId++;
        }

        $check = DB::table('urls')->insert($arrInserts);
        if ($check) {
            $topic->rendered = 1;
            return $topic->save();
        }
        return false;


    }
}