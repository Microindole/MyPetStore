package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.CartItem;
import csu.web.mypetstore.domain.Item;
import csu.web.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;

public class RemoveCartItemServlet extends HttpServlet {
    private static final String CART_FORM = "/WEB-INF/jsp/cart/cart.jsp";
    private static final String ERROR_FORM = "/WEB-INF/jsp/common/error.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String workingItemId = req.getParameter("workingItemId");
        Item item = cart.removeItemById(workingItemId);
        Account account = (Account)session.getAttribute("loginAccount");
        if (item == null) {
            session.setAttribute("errorMsg","Attempted to remove null CartItem from Cart.");
            req.getRequestDispatcher(ERROR_FORM).forward(req, resp);
        } else {

            if(account != null){
                HttpServletRequest httpRequest= req;
                String strBackUrl = "http://" + req.getServerName() + ":" + req.getServerPort()
                        + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                LogService logService = new LogService();
                String logInfo = logService.logInfo(" ") + strBackUrl + " 移除商品 " + workingItemId;
                logService.insertLogInfo(account.getUsername(), logInfo);
            }

            req.getRequestDispatcher(CART_FORM).forward(req, resp);
        }
    }
}
