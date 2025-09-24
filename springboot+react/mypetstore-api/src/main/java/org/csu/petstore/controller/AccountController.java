package org.csu.petstore.controller;


import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.request.AuthGithubRequest;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.csu.petstore.annotation.LogAccount;
import org.csu.petstore.annotation.LogAdmin;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.common.ResponseCode;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.utils.JwtBlacklist;
import org.csu.petstore.utils.JwtUtil;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/api/account")
@Validated
@SessionAttributes
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    HttpSession session;

    // 用户登录
    @LogAccount
    @PostMapping("/tokens")
    @ResponseBody
    public CommonResponse<String> login(@RequestParam String username,
                                        @RequestParam String password) {
        CommonResponse<AccountVO> response = accountService.getAccount(username, password);
        if (response.isSuccess()) {
            Map<String, Object> claims = new HashMap<>();
            claims.put("username", response.getData().getUsername());
            String token = JwtUtil.generateToken(claims);
            return CommonResponse.createForSuccess(token);
        } else {
            return CommonResponse.createForError("用户名或密码错误");
        }
    }

    // 退出登录
    @LogAccount
    @DeleteMapping("/tokens")
    @ResponseBody
    public CommonResponse<AccountVO> signOut(@RequestHeader("Authorization") String token) {
        JwtBlacklist.addTokenToBlacklist(token);
        return CommonResponse.createForSuccessMessage("用户已退出登录");
    }

    // 获取当前登录用户信息
    @LogAccount
    @PostMapping("")
    @ResponseBody
    public CommonResponse<AccountVO> getLoginAccountInfo(@RequestHeader("Authorization") String token) {
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String username = (String) claims.get("username");
        return accountService.getAccount(username);
    }

    // 用户注册
    @LogAccount
    @PostMapping("/info")
    @ResponseBody
    public CommonResponse<String> newAccount(@RequestBody AccountVO accountVO) {
        CommonResponse<AccountVO> response = accountService.insertAccountInformation(accountVO);
        if (response.isSuccess()) {
            return CommonResponse.createForSuccessMessage("注册成功");
        } else {
            return CommonResponse.createForError(ResponseCode.ERROR.getCode(), "注册失败");
        }

    }


    // 编辑用户信息
    @LogAccount
    @PostMapping("/edit")
    @ResponseBody
    public CommonResponse<String> updateAccount(@RequestBody AccountVO account) {
        CommonResponse<AccountVO> response = accountService.updateAccountInformation(account);
        if (response.isSuccess()) {
            return CommonResponse.createForSuccessMessage("用户信息更新成功");
        } else {
            return CommonResponse.createForError(ResponseCode.ERROR.getCode(), "用户信息更新失败");
        }
    }

//

}