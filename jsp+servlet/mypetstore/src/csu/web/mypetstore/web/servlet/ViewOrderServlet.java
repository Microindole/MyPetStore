package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.Order;
import csu.web.mypetstore.service.CartService;
import csu.web.mypetstore.service.LogService;
import csu.web.mypetstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ViewOrderServlet extends HttpServlet {
    private static final String VIEWORDER = "/WEB-INF/jsp/order/viewOrder.jsp";
    private static final String ERROR = "/WEB-INF/jsp/common/error.jsp";

    private Order order;
    private OrderService orderService;
    private Cart cart;
    private CartService cartService =new CartService();
    private Account account;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        order = (Order) session.getAttribute("order");
        cart = (Cart) session.getAttribute("cart");
        account= (Account) session.getAttribute("loginAccount");

        if (order != null) {
            orderService = new OrderService();
            orderService.insertOrder(order);
            session.setAttribute("order", order);
            //清空购物车
            cart = null;
            session.setAttribute("cart", cart);

            cartService.deleteCartAll(account);

            session.setAttribute("message", "Thank you, your order has been submitted.");

            //HttpSession session = request.getSession();
            Account account = (Account)session.getAttribute("loginAccount");

            if(account != null){
                HttpServletRequest httpRequest= request;
                String strBackUrl = "http://" + request.getServerName() + ":" + request.getServerPort()
                        + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                LogService logService = new LogService();
                String logInfo = logService.logInfo(" ") + strBackUrl + " 查看订单 " + order;
                logService.insertLogInfo(account.getUsername(), logInfo);
            }

            request.getRequestDispatcher(VIEWORDER).forward(request, response);
        } else {
            session.setAttribute("message", "An error occurred processing your order (order was null).");
            request.getRequestDispatcher(ERROR).forward(request, response);
        }
    }
}
