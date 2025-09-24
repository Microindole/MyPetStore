package org.csu.petstore.controller;


import org.csu.petstore.annotation.LogAccount;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DemoController {



    @LogAccount
    @GetMapping("/demo")
    @ResponseBody
    public String demo(){
        return "demo";
    }

    @LogAccount
    @GetMapping("/demo1")
    public String demo1(Model model){
        model.addAttribute("message", "hello thymeleaf");
        return "demo1";
    }
}
