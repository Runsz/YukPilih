<?php

namespace App\Http\Middleware;

use App\Models\choices;
use App\Models\LoginToken;
use App\Models\Polling;
use App\Models\User;
use App\Models\vote as ModelsVote;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Symfony\Component\HttpFoundation\Response;

class vote
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $token = $request->token;
        $user = LoginToken::where('token', $token)->first();
        $polling = Polling::find($request->id);
        $votes = ModelsVote::where('poll_id', $request->id)->get();
        $choices = choices::where('poll_id',$request->id)->get();

        if($polling==null){
            return response()->json("Polling tidak ditemukan",404);
        }

        $status = false;
        foreach ($votes as $vote) {
            if ($user->user_id == $vote->user_id) {
                if ($polling->id == $vote->poll_id) {
                    $status = true;
                }
            }
        }
        if ($status == true) {
            return response()->json("anda sudah memilih",400);
        }


        $deadline = new Carbon($polling->deadline);
        $now = Carbon::now();
        $selisih = $deadline->diff($now);
        if ($selisih->invert <= 0) {
            return response()->json("Waktu polling sudah habis",400);
        }

        $pilihan = false;
        foreach ($choices as $choice) {
            if ($request->choice_id == $choice->id) {
                $pilihan = true;
            }
        }
        if ($pilihan == false) {
            return response()->json("choice tidak ada",404);
        }

        return $next($request);
    }
}
