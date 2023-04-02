<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Polling extends Model
{
    use HasFactory;

    protected $fillable = [
        "title","description","deadline","created_by"
    ];

    public function admin(){
        return $this->belongsTo(User::class,'created_by','id');
    }

    public function choices(){
        return $this->hasMany(choices::class,'poll_id','id');
    }

    public function votes(){
        return $this->hasMany(vote::class, 'choice_id','id');
    }
}
