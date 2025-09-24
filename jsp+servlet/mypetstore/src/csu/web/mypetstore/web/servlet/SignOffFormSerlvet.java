package csu.web.mypetstore.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SignOffFormSerlvet extends HttpServlet {
    private static final String MAIN_FORM = "/WEB-INF/jsp/catalog/main.jsp";
//退出登录，这里用的是结束session的生命周期的方法
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.getSession().removeAttribute("username");
        req.getSession().removeAttribute("password");
        session.invalidate();
        req.getRequestDispatcher(MAIN_FORM).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
