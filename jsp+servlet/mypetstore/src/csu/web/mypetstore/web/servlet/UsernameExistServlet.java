package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.persistence.AccountDao;
import csu.web.mypetstore.persistence.impl.AccountDaoImpl;
import csu.web.mypetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UsernameExistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        AccountService accountService = new AccountService();
        Account account = new Account();
        AccountDao accountDao = new AccountDaoImpl();
        boolean usernameExist = accountDao.selectAccountByUsername(username);

        resp.setContentType("text/plain");
        PrintWriter out = resp.getWriter();
        if (usernameExist) {
            out.print("Exist");
        }else{
            out.print("No exist");
        }



    }
}
