<?php

namespace App\Http\Controllers;

use App\Models\LoginToken;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    public function login(Request $request){
        $validator = Validator::make($request->all(),[
            'username' => 'required|exists:users',
            'password' => 'required'
        ],[
            'username.required' => 'username harus diisi',
            'username.exists' => 'username tidak ditemukan',
            'password.required' => 'password harus diisi',
        ]);

        $validator->validate();

        $user = User::with('token')->where('username', $request->username)->first();

        if (!$user || ! Hash::check($request->password, $user->password)) {
            return response()->json('Email atau password yang anda masukkan salah',401);
        }

        if ($user->token != null) {
            return response()->json("anda sudah login",400);
        }

        $token = LoginToken::createToken($user->id);

        if ($user->update_at == null) {
            return response()->json([
                "status" => 'Change Your Password',
                "token" => $token
            ]);
        }

        return response()->json([
            "status" => 'login sukses',
            "token" => $token
        ]);
    }

    public function change(Request $request){
        $token = LoginToken::where('token', $request->token)->first();         
        $user = User::where('id',$token->user_id)->first();

        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|min:8|confirmed',
        ],[
            'old_password.required' => 'password harus diisi',
            'new_password.required' => 'password baru harus diisi',
            'new_password.min' => 'password minimal 8 digit',
            'new_password.confirmed' => 'confirm password harus sama'
        ]);

        $password = $user->password;
        $oldPassword = $request->old_password;
        
        if (! Hash::check($oldPassword, $password)) {
            return "old password salah";
        }
        
        $user->update([
            'password' => bcrypt($request->new_password),
        ]);

        $token->delete();
        
        return response()->json([
            "status" => 'Password berhasil diganti',
            "data" => $user
        ],200);
    }

    public function logout(Request $request){
        $token = $request->token;
        $data = LoginToken::where('token', $token)->delete();

        return response()->json([
            'status' => 'Logout berhasil'
        ]);
    }

    public function user(Request $request){
        $token = LoginToken::where('token', $request->token)->first();
        $user = User::where('id', $token->user_id)->first();
        return response()->json($user,200);
    }
}
