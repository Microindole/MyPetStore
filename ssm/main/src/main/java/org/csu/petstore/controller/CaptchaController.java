package org.csu.petstore.controller;

import com.google.code.kaptcha.Producer;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.LogAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class CaptchaController {

    @Autowired
    private Producer captchaProducer;


    @LogAccount
    @GetMapping("/captcha")
    public void getCaptcha(HttpServletResponse response, HttpSession session) throws IOException {
        // 设置响应头信息
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");

        // 生成验证码
        String captchaText = captchaProducer.createText();
        session.setAttribute("captcha", captchaText);

        // 输出验证码图片
        BufferedImage image = captchaProducer.createImage(captchaText);
        ImageIO.write(image, "jpg", response.getOutputStream());
    }
}