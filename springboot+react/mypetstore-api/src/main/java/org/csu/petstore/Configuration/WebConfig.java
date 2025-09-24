package org.csu.petstore.Configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private LoginInterceptor loginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 添加登录拦截器
        registry.addInterceptor(loginInterceptor)
                .excludePathPatterns("/api/account/tokens", "/api/catalog/**",
                        "/api/account/info","/api/admin",
                        "","/api/account/render","/api/account/callback","/api/oauth/**"); // 排除登录、注册和验证码请求
    }




}
