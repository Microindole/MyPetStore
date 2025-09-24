package org.csu.petstore.controller;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import jakarta.servlet.http.HttpServletResponse;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.request.AuthGithubRequest;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.utils.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/oauth")
public class OAuthController {

    @Autowired
    private AccountService accountService;


    @Autowired
    private HttpServletResponse response;

    /********************   第三方登录Github      ***************************/
    // 登录
    @CrossOrigin(origins = "http://localhost:5173", allowCredentials = "true")
    @RequestMapping("/render")
    public void renderAuth(HttpServletResponse response) throws IOException {
        AuthRequest authRequest = getAuthRequest(); // 获取 GitHub 授权请求对象
        response.sendRedirect(authRequest.authorize(AuthStateUtils.createState())); // 跳转到 GitHub 授权页面
    }


    // 回调
    @CrossOrigin(origins = "http://localhost:5173", allowCredentials = "true")
    @RequestMapping("/callback")
    public void login(AuthCallback callback) throws IOException {

        AuthRequest authRequest = getAuthRequest();
        //获取 GitHub 返回的用户信息
//        return authRequest.login(callback);

        JSONObject jsonObject = JSONUtil.parseObj(authRequest.login(callback),false);
        JSONObject userInfo = JSONUtil.parseObj(jsonObject.get("data"), false);
        // 获取从 GitHub 返回的用户基本信息
        String githubUuid = userInfo.getStr("uuid");
        String username = userInfo.getStr("username");
        String avatar = userInfo.getStr("avatar");
        System.out.println(githubUuid+","+username+","+avatar);
        // 查询 signon 表中是否已有该 GitHub 用户
        SignOn signon = accountService.getSinOnByOtherPlatform(username).getData();

        String token = "";
        // 如果该 GitHub 用户已经存在
        if (signon != null) {
            Map<String, Object> claims = new HashMap<>();
            claims.put("username", username);
            token = JwtUtil.generateToken(claims);
        } else {
            // 如果是新用户，通过 GitHub 信息进行注册
            token = "null";
        }
//        response.sendRedirect("http://localhost:5173/account/github-callback");
        response.sendRedirect("http://localhost:5173/account/github-callback?token=" + token+"&username=" + username);
    }

    // 配置信息
    private AuthRequest getAuthRequest() {
        return new AuthGithubRequest(AuthConfig.builder()
                .clientId("Ov23lieIV1CXDvFjY4yt")
                .clientSecret("5e8143561815849d2964aa9d39da4d77e2d1fc0d")
                .redirectUri("http://localhost:8070/api/oauth/callback")
                .build());
    }


}
// Ov23lieIV1CXDvFjY4yt
 // 5e8143561815849d2964aa9d39da4d77e2d1fc0d