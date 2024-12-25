package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.persistence.AccountDao;
import csu.web.mypetstore.persistence.impl.AccountDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditAccountServlet extends HttpServlet {
    private static final String EDIT_ACCOUNT = "/WEB-INF/jsp/account/newAccount.jsp";
    private static final String EDIT_ACCOUNT_FORM = "/WEB-INF/jsp/account/editAccount.jsp";

    private String msg;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String password = req.getParameter("password");
        String repeatedPassword = req.getParameter("repeatedPassword");
        if (!password.equals(repeatedPassword)) {
            this.msg = "Enter the password twice different!";
            req.setAttribute("errorMsg", msg);
            req.getRequestDispatcher(EDIT_ACCOUNT_FORM).forward(req, resp);
        }else{
            updateAccountInfo(req, resp);
            this.msg = "Save successfully!";
            req.setAttribute("successMsg", msg);
            req.getRequestDispatcher(EDIT_ACCOUNT).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
    private void updateAccountInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("loginAccount");
        account.setPassword(req.getParameter("password"));
        account.setFirstName(req.getParameter("firstName"));
        account.setLastName(req.getParameter("lastName"));
        account.setEmail(req.getParameter("email"));
        account.setPhone(req.getParameter("phone"));
        account.setAddress1(req.getParameter("address1"));
        account.setAddress2(req.getParameter("address2"));
        account.setCity(req.getParameter("city"));
        account.setState(req.getParameter("state"));
        account.setZip(req.getParameter("zip"));
        account.setCountry(req.getParameter("country"));
        account.setLanguagePreference(req.getParameter("languagePreference"));
        account.setListOption("1".equals(req.getParameter("listOption")));
        account.setBannerOption("1".equals(req.getParameter("bannerOption")));
        account.setFavouriteCategoryId(req.getParameter("favouriteCategoryId"));

        session.setAttribute("loginAccount", account);
    }
}
