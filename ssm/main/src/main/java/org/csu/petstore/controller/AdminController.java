package org.csu.petstore.controller;



import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.LogAdmin;
import org.csu.petstore.service.AdminService;
import org.csu.petstore.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("admin")
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    private static final int MAX_FAIL_TIMES = 5;
    private static final int LOCK_TIME = 30;


    @LogAdmin
    @GetMapping("login")
    public String showindex(Model model){
        return "admin/signon";
    }


    @LogAdmin
    @PostMapping("getadmin")
    public String getAdmin(@RequestParam String username,
                           @RequestParam String password,
                           Model model,
                           RedirectAttributes redirectAttributes,
                           HttpSession session) {

        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            redirectAttributes.addFlashAttribute("error", "用户名或密码不能为空");
            return "redirect:/signon";
        }
        AdminVO adminVO = adminService.getAdmin(username, password);
        if (adminVO != null) {
            session.setAttribute("admin", adminVO);
            return "admin/index";
        } else {
            session.setAttribute("error", "用户名或密码错误");
            return "admin/signon";
        }
    }

    @LogAdmin
    @GetMapping("/index")
    public String adminIndex(@SessionAttribute("admin") AdminVO adminVO ,Model model) {
        model.addAttribute("admin",adminVO);
        model.addAttribute("message", "欢迎管理员！");
        return "admin/index";
    }


    @LogAdmin
    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.removeAttribute("admin");
        redirectAttributes.addFlashAttribute("success", "登出成功");
        return "redirect:/admin/login";
    }
}

