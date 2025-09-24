package org.csu.petstore.controller;

import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.LogAccount;
import org.csu.petstore.entity.Order;
import org.csu.petstore.service.CartService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItemListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private HttpSession session;

    @LogAccount
    @GetMapping("/newOrder")
    public String newOrder(Model model) {
        Order order = new Order();
        session.setAttribute("order", order);
        AccountVO account = (AccountVO) session.getAttribute("account");
        orderService.setOrder(order,account);
        model.addAttribute("loginAccount", account);
        model.addAttribute("order", order);
        session.setAttribute("loginAccount", account);
        return "order/newOrder";
    }

    @LogAccount
    @PostMapping("/confirmOrder")
    public String confirmOrder(@ModelAttribute("order") Order order, Model model) {
        AccountVO account = (AccountVO) session.getAttribute("loginAccount");
        String userId = account.getUsername();
        order.setUserId(userId);

        order.setTotalPrice((BigDecimal) session.getAttribute("subTotal"));

        orderService.insertOrder(order,account);
        session.setAttribute("order", order);
        cartService.clearCart(userId);
        return "order/confirmOrder";
    }
    @LogAccount
    @GetMapping("/viewOrder")
    public String viewOrder(Model model) {
        AccountVO account = (AccountVO) session.getAttribute("account");
        //如何获得order存疑
        Order order = (Order) session.getAttribute("order");
        CartItemListMapper cartItemListMapper = (CartItemListMapper) session.getAttribute("cartItemListMapper");

        orderService.finishOrder(order,cartItemListMapper);

        return "catalog/main";
    }
    @LogAccount
    @GetMapping("/listOrder")
    public String listOrder(String username,Model model) {
        List<Order> orderList = orderService.getOrdersByUsername(username);
        model.addAttribute("orderList", orderList);
        return "order/listOrder";
    }

}

