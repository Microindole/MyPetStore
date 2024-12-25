package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CartForm extends HttpServlet {
    private Cart cart;
    private static final String CART_FORM = "/WEB-INF/jsp/cart/cart.jsp";
    public static final String SIGNON_FORM = "/WEB-INF/jsp/account/signon.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("loginAccount");
        if (account == null) {
            req.getRequestDispatcher(SIGNON_FORM).forward(req, resp);
        } else {

            if(account != null){
                HttpServletRequest httpRequest= req;
                String strBackUrl = "http://" + req.getServerName() + ":" + req.getServerPort()
                        + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                LogService logService = new LogService();
                String logInfo = logService.logInfo(" ") + strBackUrl + " 预览订单 ";
                logService.insertLogInfo(account.getUsername(), logInfo);
            }

            cart= (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            session.setAttribute("cart", cart);
            req.getRequestDispatcher(CART_FORM).forward(req, resp);
        }
    }
}
