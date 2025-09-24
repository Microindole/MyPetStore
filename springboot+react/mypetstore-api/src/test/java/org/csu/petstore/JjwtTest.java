package org.csu.petstore;


import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.csu.petstore.utils.JwtUtil;
import org.junit.jupiter.api.Test;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JjwtTest {
    @Test
    public void testGen(){
        Map<String,Object> claims = new HashMap<>();
        claims.put("id",1);
        claims.put("username","1111");

        String token = JWT.create()
                .withClaim("username", claims)  //添加载荷
                .withExpiresAt(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 12)) //设置过期时间 12小时
                .sign(Algorithm.HMAC256("mypetstore-api"));//设置签名算法和密钥

        System.out.println(token);


    }

    @Test
    public void testParse(){
        String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9." +
                "eyJ1c2VybmFtZSI6eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9LCJleHAiOjE3NDM0NzMyMjR9." +
                "mYoiqvfGC510kC2z8EEOuZC2D4EcWvnNe9ZYRtN7ubM";

        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256("mypetstore-api")) //设置签名算法和密钥
                .build();

        DecodedJWT decodedJWT = jwtVerifier.verify(token);//验证token的合法性
        Map<String, Claim> claims = decodedJWT.getClaims(); //获取载荷
        System.out.println(claims.get("username"));

    }

    @Test
    public void sss(){
        Map<String, Object> claims = new HashMap<>();
        claims.put("username","1111");
        String token = JwtUtil.generateToken(claims);
        System.out.println(token);
    }


}