package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.Order;
import csu.web.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class NewOrderFormServlet extends HttpServlet {
    private static final String NEW_ORDER = "/WEB-INF/jsp/order/newOrder.jsp";
    private static final String SIGNONFORM = "/WEB-INF/jsp/account/signon.jsp";
    private static final String ERROR = "/WEB-INF/jsp/common/error.jsp";

    private Account account;
    private Order order;
    private Cart cart;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        account = (Account)session.getAttribute("loginAccount");
        cart = (Cart)session.getAttribute("cart");

        if (account == null){
            session.setAttribute("message", "You must sign on before attempting to check out.  Please sign on and try checking out again.");
            request.getRequestDispatcher(SIGNONFORM).forward(request, response);
            System.out.println("Account is not found in the session.");
        } else if(cart != null){
            System.out.println("Account found in session: " + account.getUsername());
            order = new Order();
            order.initOrder(account, cart);
            session.setAttribute("order", order);

            if(account != null){
                HttpServletRequest httpRequest= request;
                String strBackUrl = "http://" + request.getServerName() + ":" + request.getServerPort()
                        + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                LogService logService = new LogService();
                String logInfo = logService.logInfo(" ") + strBackUrl + " 跳转到新订单页面";
                logService.insertLogInfo(account.getUsername(), logInfo);
            }

            request.getRequestDispatcher(NEW_ORDER).forward(request, response);
        }else{
            session.setAttribute("message", "An order could not be created because a cart could not be found.");

            Account account = (Account)session.getAttribute("account");

            if(account != null){
                HttpServletRequest httpRequest= request;
                String strBackUrl = "http://" + request.getServerName() + ":" + request.getServerPort()
                        + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                LogService logService = new LogService();
                String logInfo = logService.logInfo(" ") + strBackUrl + " 生成订单页面信息错误";
                logService.insertLogInfo(account.getUsername(), logInfo);
            }

            request.getRequestDispatcher(ERROR).forward(request, response);
        }
    }
}
