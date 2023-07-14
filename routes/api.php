<?php

use App\Jobs\ValidationsJob;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
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



Route::middleware('api')->group(function () {
    Route::post('/queue/validations', function (Request $request) {

        ValidationsJob::dispatch($request->all())->onQueue('default');

        return response()->json(["msg" => "Job despachado com sucesso!"]);
    });

    Route::get('/clear-redis', function() {
        Redis::flushall();
        return response()->json(['msg' => 'Dados do Redis limpos com sucesso!']);
    });
});
