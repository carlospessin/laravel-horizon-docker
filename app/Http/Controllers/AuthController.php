<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function verification(Request $request)
    {
        $tokenMobile = '0';
        $tokenWeb = '1';
    
        $httpToken = $request->server->get('HTTP_TOKEN');
    
        if ($httpToken === $tokenMobile) {
            $token = 'mobile';
        } elseif ($httpToken === $tokenWeb) {
            $token = 'web';
        } else {
            return response()->json(["error" => "Token inválido"], 400);
        }
    
        $redisController = new RedisController();
        return $redisController->validation($request, $token);
    }
}
