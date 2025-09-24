package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.CartItem;
import csu.web.mypetstore.domain.Product;
import csu.web.mypetstore.persistence.impl.AccountDaoImpl;
import csu.web.mypetstore.service.AccountService;
import csu.web.mypetstore.service.CartService;
import csu.web.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class SignonServlet extends HttpServlet {

    private static final String SIGN_ON_FORM = "/WEB-INF/jsp/account/signon.jsp";


    private String username;
    private String password;
    private String msg;
    private Cart cart;
    private List<CartItem> cartItemList;
    String token;//正确的验证码
    String code;//用户输入的验证码


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");


        HttpSession session = req.getSession();

        //获取验证码
        token = (String) session.getAttribute(KAPTCHA_SESSION_KEY);
        //删除验证码
        session.removeAttribute(KAPTCHA_SESSION_KEY);
        //获取用户输入的验证码
        code = req.getParameter("code");


        //校验用户输入的正确性
        //登录失败，根据SignonServlet的配置到/signon中，即跳转到signon.jsp并带上错误信息
        if(!validdate()){
            req.setAttribute("signOnMsg", this.msg);
            req.getRequestDispatcher(SIGN_ON_FORM).forward(req, resp);
        } else if (token != null && token.equals(code)) {
            AccountService accountService=new AccountService();
            Account loginAccount=accountService.getAccount(username, password);

            loginAccount.setUsername(username);
            loginAccount.setPassword(password);


            AccountDaoImpl accountDao=new AccountDaoImpl();
            boolean test=accountDao.selectAccountByUsername(loginAccount.getUsername());
            boolean test1=accountDao.selectAccountByPassword(loginAccount.getPassword());

            System.out.println("help");

            if(test && test1){

                loginAccount.setPassword(null);
                //HttpSession session=req.getSession();
                session.setAttribute("loginAccount", loginAccount);

                CartService cartService=new CartService();
                cartItemList=cartService.getCartItems(loginAccount);
                cart=new Cart();
                CatalogService catalogService = new CatalogService();

                if (cartItemList!=null){
                    for (CartItem cartItem:cartItemList) {
                        boolean isInstock = catalogService.isItemInStock(cartItem.getItem().getItemId());
                        cart.addItemFromSQL(cartItem,isInstock);
                    }

                }

                session.setAttribute("cart",cart);

                if(loginAccount.isListOption()){
                    List<Product> myList=catalogService.getProductListByCategory(loginAccount.getFavouriteCategoryId());
                    session.setAttribute("myList", myList);
                }
                resp.sendRedirect("mainForm");
            }
            else {
                this.msg="用户名或密码错误";
                req.setAttribute("signOnMsg", this.msg);
                req.getRequestDispatcher(SIGN_ON_FORM).forward(req, resp);
            }
        } else {
            this.msg="验证码错误";
            req.setAttribute("signOnMsg", this.msg);
            req.getRequestDispatcher(SIGN_ON_FORM).forward(req, resp);
        }
    }
    private boolean validdate(){
        if (this.username == null || this.username.equals("")){
            this.msg = "用户名不能为空";
            return false;
        }
        if (this.password == null || this.password.equals("")){
            this.msg = "密码不能为空";
            return false;
        }return true;
    }
}
