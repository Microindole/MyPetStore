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

public class ConfirmOrderFormServlet extends HttpServlet {
    private static final String CONFIRM_ORDER_FORM = "/WEB-INF/jsp/order/confirmOrder.jsp";
    private static final String SHIPPINGFORM = "/WEB-INF/jsp/order/shippingForm.jsp";

    private String shippingAddressRequired;
    private Order order;
    private OrderService orderService;




//    private Order order;
    private String shipToFirstName;
    private String shipToLastName;
    private String shipAddress1;
    private String shipAddress2;
    private String shipCity;
    private String shipState;
    private String shipZip;
    private String shipCountry;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        shippingAddressRequired = req.getParameter("shippingAddressRequired");
        order = new Order();

        HttpSession session = req.getSession();
        order = (Order)session.getAttribute("order");
        Account account = (Account)session.getAttribute("account");

        if (shippingAddressRequired == null){
            if(account != null){
                HttpServletRequest httpRequest= req;
                String strBackUrl = "http://" + req.getServerName() + ":" + req.getServerPort()
                        + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                LogService logService = new LogService();
                String logInfo = logService.logInfo(" ") + strBackUrl + " 确认生成订单 ";
                logService.insertLogInfo(account.getUsername(), logInfo);
            }
        }
        else{
            shipToFirstName = req.getParameter("shipToFirstName");
            shipToLastName = req.getParameter("shipToLastName");
            shipAddress1 = req.getParameter("shipAddress1");
            shipAddress2 = req.getParameter("shipAddress2");
            shipCity = req.getParameter("shipCity");
            shipState = req.getParameter("shipState");
            shipZip = req.getParameter("shipZip");
            shipCountry = req.getParameter("shipCountry");
//            HttpSession session = req.getSession();
            order = (Order)session.getAttribute("order");
            order.setShipToFirstName(shipToFirstName);
            order.setShipToLastName(shipToLastName);
            order.setShipAddress1(shipAddress1);
            order.setShipAddress2(shipAddress2);
            order.setShipCity(shipCity);
            order.setShipState(shipState);
            order.setShipZip(shipZip);
            order.setCourier(shipCountry);
            session.setAttribute("order", order);
//            account = (Account)session.getAttribute("account");
            if(account != null){
                HttpServletRequest httpRequest= req;
                String strBackUrl = "http://" + req.getServerName() + ":" + req.getServerPort()
                        + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                LogService logService = new LogService();
                String logInfo = logService.logInfo(" ") + strBackUrl + " 修改订单邮寄地址";
                logService.insertLogInfo(account.getUsername(), logInfo);
            }
        }
        req.getRequestDispatcher(CONFIRM_ORDER_FORM).forward(req, resp);
    }
}
