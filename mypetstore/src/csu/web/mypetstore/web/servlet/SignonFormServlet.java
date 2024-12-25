package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SignonFormServlet extends HttpServlet {

    private static final String SIGNON_FORM = "/WEB-INF/jsp/account/signon.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(SIGNON_FORM).forward(req, resp);
    }
}
