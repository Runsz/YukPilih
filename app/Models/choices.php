<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class choices extends Model
{
    use HasFactory;

    protected $fillable = [
        'choice','poll_id'
    ];

    public function votes()
    {
        return $this->hasMany(vote::class, 'choice_id', 'id');
    }
}
