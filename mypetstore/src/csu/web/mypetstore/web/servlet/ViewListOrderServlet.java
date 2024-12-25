package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Order;
import csu.web.mypetstore.service.LogService;
import csu.web.mypetstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ViewListOrderServlet extends HttpServlet {
    private static final String VIEWLISTORDER = "/WEB-INF/jsp/order/listOrder.jsp";

    private String username;
    private OrderService orderService = new OrderService();
    private List<Order> orderList = new ArrayList<Order>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        Account account = (Account) session.getAttribute("loginAccount");
        String username = account.getUsername();
        orderList = orderService.getOrdersByUsername(username);
        session.setAttribute("orderList", orderList);

        System.out.println("Username: " + username);
        System.out.println("Order List: " + orderList);

        if(account != null){
            HttpServletRequest httpRequest= request;
            String strBackUrl = "http://" + request.getServerName() + ":" + request.getServerPort()
                    + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

            LogService logService = new LogService();
            String logInfo = logService.logInfo(" ") + strBackUrl + " 查看订单 " + orderList;
            logService.insertLogInfo(account.getUsername(), logInfo);
        }

        request.getRequestDispatcher(VIEWLISTORDER).forward(request, response);
    }
}
