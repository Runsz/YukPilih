<?php

use App\Http\Controllers\LoginController;
use App\Http\Controllers\PollController;
use App\Http\Controllers\VoteController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('login',[LoginController::class, 'login']);
Route::put('change-password',[LoginController::class, 'change'])->middleware('token');
Route::post('logout',[LoginController::class, 'logout'])->middleware('token');

Route::get('user',[LoginController::class, 'user'])->middleware('token');

Route::post('polling',[PollController::class, 'CreatePolling'])->middleware(['token','must-admin']);
Route::get('polling',[PollController::class, 'get'])->middleware('token');

Route::get('polling/result',[VoteController::class, 'index'])->middleware('token');

Route::get('polling/{id}',[PollController::class, 'getById'])->middleware(['token']);
Route::delete('polling/{id}',[PollController::class, 'delete'])->middleware(['token','must-admin']);

Route::post('polling/{id}/voting',[VoteController::class, 'sudahVote'])->middleware(['token','only-user']);
Route::post('polling/{id}/vote',[VoteController::class, 'voting'])->middleware(['token','only-user','vote']);

Route::get('polling/{id}/result',[VoteController::class, 'getVote'])->middleware('token');