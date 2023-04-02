<?php

namespace App\Models;

use Illuminate\Console\View\Components\Choice;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class vote extends Model
{
    use HasFactory;

    protected $fillable = [
        "choice_id","user_id","poll_id","division_id"
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function division(){
        return $this->belongsTo(Division::class);
    }

    public function poll(){
        return $this->belongsTo(Polling::class, "poll_id","id");
    }

    public function choice(){
        return $this->belongsTo(choices::class);
    }
}
