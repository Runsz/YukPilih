<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoginToken extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id", "token"
    ];

    public function user(){
        return $this->hasOne(User::class);
    }

    public static function createToken($user_id){
        $token = bcrypt($user_id);

        LoginToken::create([
            "user_id"   =>  $user_id,
            "token"     =>  $token
        ]);

        return $token;
    }
}
