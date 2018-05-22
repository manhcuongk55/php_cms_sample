<?php
/**
 * Created by PhpStorm.
 * User: T420
 * Date: 5/22/2018
 * Time: 8:22 PM
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = 'questions';

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id');
    }
}