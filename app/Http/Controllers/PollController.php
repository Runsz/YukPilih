<?php

namespace App\Http\Controllers;

use App\Models\choices;
use App\Models\LoginToken;
use App\Models\Polling;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PollController extends Controller
{
    public function CreatePolling(Request $request){
        $created_by = LoginToken::where("token",$request->token)->first();

        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'deadline' => 'required',
            'choice' => 'required'
        ],[
            'title.required' => 'Title harus diisi',
            'description.required' => 'Description harus diisi',
            'deadline.required' => 'deadline harus diisi',
            'choice.required' => 'choice harus diisi'
        ]);

        $polling = Polling::create([
            'title' => $request->title,
            'description' => $request->description,
            'deadline' => $request->deadline,
            'created_by' => $created_by->user_id,
        ]);

        $polling->save();

        $coiches = $request->choice;

        foreach ($coiches as $choice) {
            $choice = choices::create([
                'choice' => $choice,
                'poll_id' => $polling->id,
            ]);
        }

        $data = Polling::with('choices')->find($polling->id);        
    
        return response()->json($data);
    }

    public function get(){
        $pollings = Polling::with('admin')->get();

        return response()->json($pollings);
    }

    public function getById($id){
        $polling = Polling::with(['choices','admin'])->find($id);

        if($polling==null){
            return response()->json("Polling tidak ditemukan",404);
        }

        return response()->json($polling);
    }

    public function delete($id){
        $polling = Polling::find($id);

        if($polling==null){
            return response()->json("Polling tidak ditemukan",404);
        }

        $polling->delete();

        return response()->json([
            "status" => "Delete berhasil",
            "Polling" => $polling
        ]);
    }
}
