package org.csu.petstore.Configuration;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;

// 新增的跨域访问的过滤器
@Configuration
@WebFilter(filterName = "CORSFilter")
public class CORSFilter implements Filter {


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;

        // 在头部里设值允许跨域请求           “Origin”表示谁请求就允许谁跨域，第一次请求后，以后这个源头都允许你跨域
        response.setHeader("Access-Control-Allow-Origin",request.getHeader("Origin"));

        // 允许你携带Cookie  默认值是false
        response.setHeader("Access-Control-Allow-Credentials","true");

        // 允许哪些方法跨域请求
        response.setHeader("Access-Control-Allow-Methods","POST, GET, PATCH, DELETE, PUT");

        // 最长缓存时间
        response.setHeader("Access-Control-Max-Age","3600");

        // 超时时间
        response.setHeader("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept");

        // 让过滤器链接着往下走
        filterChain.doFilter(request,response);
    }
}
