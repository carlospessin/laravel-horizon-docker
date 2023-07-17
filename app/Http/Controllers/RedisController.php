<?php

namespace App\Http\Controllers;

use App\Jobs\ValidationsJob;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class RedisController extends Controller
{

    public function validation(Request $request, $token)
    {
        ValidationsJob::dispatch($request->all())->onQueue('default'); 
        return response()->json(["msg" => "Job despachado com sucesso!"]);
    }

    public function clear()
    {
        Redis::flushall();
        return response()->json(['msg' => 'Dados do Redis limpos com sucesso!']);
    }
}
