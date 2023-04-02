<?php

namespace App\Http\Middleware;

use App\Models\LoginToken;
use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class OnlyUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $admin = LoginToken::where('token',$request->token)->first();
        $user = User::where('id',$admin->user_id)->first();
        
        if ($user->role != 'user') {
            return response()->json("Khusus user");
        }
        
        return $next($request);
    }
}
