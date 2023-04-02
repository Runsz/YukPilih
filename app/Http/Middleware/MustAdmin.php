<?php

namespace App\Http\Middleware;

use App\Models\LoginToken;
use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class MustAdmin
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
        
        if ($user->role != 'admin') {
            return response()->json("Khusus admin");
        }

        return $next($request);
    }
}
