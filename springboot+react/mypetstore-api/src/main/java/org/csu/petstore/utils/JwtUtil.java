package org.csu.petstore.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Date;
import java.util.Map;

public class JwtUtil {
    private static final String KEY = "mypetstore-api"; // 密钥

    private static final long EXPIRATION_TIME = 1000 * 60 * 60 * 12; // 过期时间，12小时


    //生成token
    public static String generateToken(Map<String,Object> claims) {
        return JWT.create()
                .withClaim("claims", claims) // 添加载荷
                .withExpiresAt(new Date(System.currentTimeMillis() + EXPIRATION_TIME)) // 设置过期时间
                .sign(Algorithm.HMAC256(KEY)); // 设置签名算法和密钥
    }

    //解析,验证token
    public static Map<String, Object> parseToken(String token) {
        return JWT.require(Algorithm.HMAC256(KEY))
                .build()
                .verify(token)
                .getClaim("claims").asMap();
    }






}
