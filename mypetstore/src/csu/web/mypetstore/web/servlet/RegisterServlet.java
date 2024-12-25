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

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class RegisterServlet extends HttpServlet {
    private static final String REGIST_FORM="/WEB-INF/jsp/account/addAccountForm.jsp";
    private static final String SUCCESS_FORM="/WEB-INF/jsp/catalog/main.jsp";
    private String msg;
    String token;//正确的验证码
    String code;//用户输入的验证码

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        session.setAttribute("userid",req.getParameter("userid"));
        session.setAttribute("password",req.getParameter("password"));
        session.setAttribute("repeatedPassword",req.getParameter("repeatedPassword"));
        session.setAttribute("firstName",req.getParameter("account.firstName"));
        session.setAttribute("lastName",req.getParameter("account.lastName"));
        session.setAttribute("email",req.getParameter("account.email"));
        session.setAttribute("phone",req.getParameter("account.phone"));
        session.setAttribute("address1",req.getParameter("account.address1"));
        session.setAttribute("address2",req.getParameter("account.address2"));
        session.setAttribute("city",req.getParameter("account.city"));
        session.setAttribute("state",req.getParameter("account.state"));
        session.setAttribute("country",req.getParameter("account.country"));
        session.setAttribute("zip",req.getParameter("account.zip"));

        session.setAttribute("account.languagePreference",req.getParameter("account.languagePreference"));
        session.setAttribute("account.favouriteCategoryId",req.getParameter("account.favouriteCategoryId"));
        //session.setAttribute("account.favouriteCategory",req.getParameter("account.favouriteCategory"));

        //获取验证码
        token = (String) session.getAttribute(KAPTCHA_SESSION_KEY);
        //删除验证码
        session.removeAttribute(KAPTCHA_SESSION_KEY);
        //获取用户输入的验证码
        code = req.getParameter("code");


        AccountDao accountDao=new AccountDaoImpl();
        Account account=new Account();
        account.setUsername(session.getAttribute("userid").toString());
        account.setPassword(session.getAttribute("password").toString());
        account.setFirstName(session.getAttribute("firstName").toString());
        account.setLastName(session.getAttribute("lastName").toString());
        account.setEmail(session.getAttribute("email").toString());
        account.setPhone(session.getAttribute("phone").toString());
        account.setAddress1(session.getAttribute("address1").toString());
        account.setAddress2(session.getAttribute("address2").toString());
        account.setCity(session.getAttribute("city").toString());
        account.setState(session.getAttribute("state").toString());
        account.setCountry(session.getAttribute("country").toString());
        account.setZip(session.getAttribute("zip").toString());
        account.setStatus("OK");
        account.setFavouriteCategoryId(session.getAttribute("account.favouriteCategoryId").toString());
        account.setLanguagePreference(session.getAttribute("account.languagePreference").toString());

        boolean flag=false;
        if(!(session.getAttribute("repeatedPassword").equals(session.getAttribute("password")))){
            this.msg="different password";
            flag=true;
        }

        if (token == null || !token.equalsIgnoreCase(code)) {
            this.msg = "Invalid captcha.";
            flag = true;
        }
        if(!validate(account)||flag){
            req.setAttribute("RegisterMsg", this.msg);
            req.getRequestDispatcher(REGIST_FORM).forward(req, resp);
        }else{

            accountDao.insertAccount(account);
            accountDao.insertSignon(account);
            accountDao.insertProfile(account);


            req.getRequestDispatcher(SUCCESS_FORM).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    public boolean validate(Account account){
        String username=account.getUsername();
        AccountDao accountDao=new AccountDaoImpl();

        accountDao.selectAccountByUsername(username);

        if(accountDao.selectAccountByUsername(username)){
            this.msg="Account name already exist";
            return false;
        }
        if(account.getUsername()==null||account.getUsername().equals("") ){
            this.msg="Username is required";
            return false;
        }
        if(account.getPassword()==null||account.getPassword().equals("") ){
            this.msg="Password is required";
            return false;
        }
        if(account.getFirstName()==null||account.getFirstName().equals("") ){
            this.msg="First name is required";
            return false;
        }
        if(account.getLastName()==null||account.getLastName().equals("") ){
            this.msg="Last name is required";
            return false;
        }
        if(account.getEmail()==null||account.getEmail().equals("") ){
            this.msg="Email is required";
            return false;
        }
        if(account.getPhone()==null||account.getPhone().equals("") ){
            this.msg="Phone is required";
            return false;
        }
        if(account.getAddress1()==null||account.getAddress1().equals("") ){
            this.msg="Address1 is required";
            return false;
        }
        if(account.getAddress2()==null||account.getAddress2().equals("") ){
            this.msg="Address2 is required";
            return false;
        }
        if(account.getCity()==null||account.getCity().equals("") ){
            this.msg="City is required";
            return false;
        }
        if(account.getState()==null||account.getState().equals("")){
            this.msg="State is required";
            return false;
        }
        if(account.getCountry()==null||account.getCountry().equals("")){
            this.msg="Country is required";
            return false;
        }
        if(account.getZip()==null||account.getZip().equals("")){
            this.msg="Zip is required";
            return false;
        }
        return true;
    }
}
