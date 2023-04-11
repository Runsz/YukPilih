<?php

namespace App\Http\Controllers;

use App\Models\choices;
use App\Models\Division;
use App\Models\LoginToken;
use App\Models\Polling;
use App\Models\User;
use App\Models\vote;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class VoteController extends Controller
{
    public function voting(Request $request, $id){
        $token = LoginToken::where('token', $request->token)->first();
        $user = User::where('id', $token->user_id)->first();

        $request->validate([
            'choice_id' => 'required|integer',
        ],[
            'choice_id.required' => 'choice_id tidak boleh kosong',
            'choice_id.integer' => 'choice_id harus integer',
        ]);

        $vote = vote::create([
            'choice_id' => $request->choice_id,
            'user_id' => $token->user_id,
            'poll_id' => $id,
            'division_id' => $user->division_id,
        ]);

        return response()->json([
            'status' => "Voting berhasil",
            'data' => $vote
        ]);
    }

    public function getVote(Request $request, $id){
        if (vote::where('poll_id', $id)->first() == null) {
            return response()->json('polling id tidak ada',404);
        }

        $Polling = Polling::with('choices')->find($id);
        $choices = choices::where("poll_id",$id)->with('votes')->get();
        $divisions = Division::all();
        
        $votes = [];
        $PointChoice = [];
        $jml = 0;
        $persen = [];

        foreach($divisions as $division){  
            $divisi = [];
            foreach($choices as $choice){
                $divisi[$choice->choice] =  $choice->votes->where('division_id', $division->id)->count();
            }
            $max = collect($divisi)->flatten()->max();

            $filter = collect($divisi)->filter(function($val, $key) use ($max) {
                return $val == $max;
            })->all();

            $point = collect($filter)->map(function($val, $key) use ($filter, $max) {
                return $max !== 0 ? 1 / count($filter) : 0;
            })->all();

            $votes[$division->name] = $point;

            foreach($point as $key => $p) {
                if (isset($PointChoice[$key])) {
                    $PointChoice[$key] += (float) $p;
                } else {
                    $PointChoice[$key] = (float) $p;
                }
            }
        }

        foreach ($PointChoice as $key => $v) {
            $jml += (float) $v;
        }

        foreach ($PointChoice as $key => $v) {
            $persen[$key] = round($v / $jml * 100, 2);
            // array_push($persen, [ $key => round($v / $jml * 100, 2)]); 
        }

        return response()->json($persen);

        // return response()->json([
        //     "Vote Per divisi" => $votes,
        //     "Vote per choice" => $PointChoice,
        //     $Polling->title => $persen
        // ]);

        // return response()->json($filter);
    }

    
    public function index(){
        $polls = Polling::with(['choices','choices.votes','admin'])->get();
        $result = [];
        foreach ($polls as $poll) {
            $divisionHasVote = [];
            $ngitungPointChoice = [];
            foreach (Division::all() as $division) {
                $temp = [];
                foreach ($poll->choices as $choice) {
                    $temp[$choice->choice] = $choice->votes->where('division_id', $division->id)->count();
                }          
                $max = collect($temp)->flatten()->max();

                $filter = collect($temp)->filter(function($val, $key) use ($max) {
                    return $val == $max;
                })->all();

                $point = collect($filter)->map(function($val, $key) use ($filter, $max) {
                    return $max !== 0 ? 1 / count($filter) : 0;
                })->all();

                $divisionHasVote[$division->name] = $point;

                foreach($point as $key => $p) {
                    if (isset($ngitungPointChoice[$key])) {
                        $ngitungPointChoice[$key] += (float) $p;
                    } else {
                        $ngitungPointChoice[$key] = (float) $p;
                    }
                }
            }
            $result[$poll->title] = $ngitungPointChoice;
        }

        return response()->json([$result]);
    }

    public function sudahVote(Request $request){
        // dd($request);
        $token = $request->token;
        $user = LoginToken::where('token', $token)->first();
        $polling = Polling::find($request->id);
        $votes = vote::where('poll_id', $request->id)->get();

        $status = false;
        foreach ($votes as $vote) {
            if ($user->user_id == $vote->user_id) {
                if ($polling->id == $vote->poll_id) {
                    $status = true;
                }
            }
        }

        $deadline = new Carbon($polling->deadline);
        $now = Carbon::now();
        $selisih = $deadline->diff($now);
        if ($selisih->invert <= 0) {
            return response()->json([
                "voting" => $status,
                "waktu" => true
            ]);
        }
        else{
            return response()->json([
                "voting" => $status,
                "waktu" => false
            ]);
        }
    }
}
