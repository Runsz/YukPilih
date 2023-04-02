<?php

namespace App\Http\Middleware;

use App\Models\LoginToken;
use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Token
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $request->validate([
            'token' => 'required|exists:login_tokens'
        ],[
            'token.required' => 'token not null',
            'token.exists' => 'Anda belum login atau Token not valid',
        ]);

        return $next($request);
    }
}
