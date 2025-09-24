package org.csu.petstore.controller;


import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.Annotation;
import org.csu.petstore.entity.Account;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/account")
@Validated
@SessionAttributes
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    HttpSession session;

    @Annotation
    @GetMapping("/signonForm")
    public String signOn(){
        return "account/signon";
    }
    @Annotation
    @GetMapping("/signOut")
    public String signOut(){
        session.invalidate();
        return "catalog/main";
    }
    @Annotation
    @GetMapping("/newAccountForm")
    public String newAccountForm(Model model){
        model.addAttribute("account", new AccountVO());
        return "/account/newAccount";
    }
    @Annotation
    @GetMapping("/editForm")
    public String editAccount(Model model){
        AccountVO account = (AccountVO) session.getAttribute("account");
        model.addAttribute("userinfo", account);
        return "/account/editAccount";
    }
    @Annotation
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

    @Annotation
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

    @Annotation
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

//    @PostMapping("/saveAccount")
//    public String saveAccount(@ModelAttribute("editAccount") AccountVO account, Model model){
//        model.addAttribute("editAccount",account);
//        System.out.println(account);
////        account.setUsername(session.getAttribute("account"));
//        AccountVO accountVO = (AccountVO) session.getAttribute("account");
//        String username = accountVO.getUsername();
//        account.setUsername(username);
//        session.setAttribute("account",account);
//        accountService.insertAccountInformation(account);
//        return "catalog/main";
//    }

}
