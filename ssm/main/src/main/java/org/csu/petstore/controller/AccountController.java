package org.csu.petstore.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.LogAccount;
import org.csu.petstore.annotation.LogAdmin;
import org.csu.petstore.entity.Account;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/account")
@Validated
@SessionAttributes
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    HttpSession session;

    // 跳转到用户登录界面
    @LogAccount
    @GetMapping("/signonForm")
    public String signOn(){
        return "account/signon";
    }

    // 用户登录
    @LogAccount
    @PostMapping("/signon")
    public String signOnSubmit(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("code") String code, Model model){
        // 获取会话中的验证码
        String captcha = (String) session.getAttribute("captcha");
        if (captcha != null && captcha.equalsIgnoreCase(code)) {
            // 验证成功
            int result = accountService.signonForm(username,password);
            if(result == 0){
                AccountVO accountVO = accountService.getAccount(username);
                model.addAttribute("account",accountVO);
                session.setAttribute("account",accountVO);
                return "catalog/main";
            } else if (result == 2) {
                model.addAttribute("loginMsg","密码错误");
                return "account/signon";
            }else{
                model.addAttribute("loginMsg","用户名不存在");
                return "account/signon";
            }
        } else {
            // 验证失败
            model.addAttribute("loginMsg", "验证码错误");
            return "account/signon";
        }

    }




    // 退出登录
    @LogAccount
    @GetMapping("/signOut")
    public String signOut(){
        session.invalidate();
        return "catalog/main";
    }

    // 跳转到注册界面
    @LogAccount
    @GetMapping("/newAccountForm")
    public String newAccountForm(Model model){
        model.addAttribute("account", new AccountVO());
        return "/account/newAccount";
    }

    // 用户注册
    @LogAccount
    @PostMapping("/newAccount")
    public String newAccount(@ModelAttribute("account") AccountVO account, @RequestParam("code") String code, Model model){
        // 获取会话中的验证码
        String captcha = (String) session.getAttribute("captcha");
        if (captcha != null && captcha.equalsIgnoreCase(code)) {
            model.addAttribute("account",account);
            System.out.println(account);
            session.setAttribute("account",account);
            accountService.insertAccountInformation(account);
            return "catalog/main";
        } else {
            // 验证失败
            model.addAttribute("loginMsg", "验证码错误");
            return "account/newAccount";
        }

    }


    // 跳转到编辑用户信息界面
    @LogAccount
    @GetMapping("/editForm")
    public String editAccount(Model model){
        AccountVO account = (AccountVO) session.getAttribute("account");
        model.addAttribute("userinfo", account);
        return "/account/editAccount";
    }

    // 编辑用户信息
    @LogAccount
    @PostMapping("/edit")
    public String updateAccount(@ModelAttribute AccountVO account, @RequestParam("code") String code, Model model) {
        String captcha = (String) session.getAttribute("captcha");
        if (captcha != null && captcha.equalsIgnoreCase(code)) {
            String username = ((AccountVO) session.getAttribute("account")).getUsername();
            String password = ((AccountVO) session.getAttribute("account")).getPassword();
            account.setUsername(username);
            if (account.getPassword() == "") {
                account.setPassword(password);
            }
            accountService.updateAccountInformation(account);
            session.setAttribute("account",account);
            return "catalog/main"; // 重定向到用户列表
        } else {
            // 验证失败
            model.addAttribute("loginMsg", "验证码错误");
            AccountVO accountRecover = (AccountVO) session.getAttribute("account");
            model.addAttribute("userinfo", accountRecover);
            return "account/editAccount";
        }

    }








    @LogAdmin
    @GetMapping("/accounts")
    public String listAccounts(
            @RequestParam(required = false) String username,
            @SessionAttribute("admin") AdminVO adminVO,
            Model model
    ) {
        model.addAttribute("admin", adminVO);


        LambdaQueryWrapper<Account> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotBlank(username)) {
            wrapper.like(Account::getUsername, username); // 模糊匹配用户名
        }

        List<Account> accounts = accountService.getAllAccounts(wrapper);
        model.addAttribute("accounts", accounts);
        return "admin/userinfo";
    }



    // 查看用户详情
    @LogAdmin
    @GetMapping("/{id}")
    public String viewAccount(@SessionAttribute("admin") AdminVO adminVO ,@PathVariable String id, Model model) {
        model.addAttribute("admin",adminVO);
        Account account = accountService.getAccountById(id);
        model.addAttribute("account", account);
        return "admin/userdetail";
    }

    // 编辑用户信息
    @LogAdmin
    @GetMapping("/edits/{id}")
    public String editAccount(@SessionAttribute("admin") AdminVO adminVO ,@PathVariable String id, Model model) {
        model.addAttribute("admin",adminVO);
        Account account = accountService.getAccountById(id);
        model.addAttribute("account", account);
        return "admin/useredit";
    }

    // 编辑提交
    @LogAdmin
    @PostMapping("/edits")
    public String updateAccount(@SessionAttribute("admin") AdminVO adminVO ,@ModelAttribute Account account,Model model) {
        model.addAttribute("admin",adminVO);
        accountService.updateAccount(account);
        return "redirect:/account/accounts";
    }
    //重置密码
    @LogAdmin
    @PostMapping("/reset-password")
    public String resetPassword(@SessionAttribute("admin") AdminVO adminVO ,@RequestParam String username, Model model) {
        model.addAttribute("admin",adminVO);
        try {
            accountService.resetPasswordToDefault(username);
            model.addAttribute("message", "密码已重置为123456");
        } catch (Exception e) {
            model.addAttribute("error", "重置失败，请重试");
        }
        return "redirect:/account/accounts";
    }


}
