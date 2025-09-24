package org.csu.petstore.controller;

import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.LogAccount;
import org.csu.petstore.annotation.LogAdmin;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.Order;
import org.csu.petstore.persistence.OrderMapper;
import org.csu.petstore.service.CartService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.impl.AccountServiceImpl;
import org.csu.petstore.utils.JwtUtil;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItem;
import org.csu.petstore.vo.CartItemListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private HttpSession session;
    @Qualifier("orderMapper")
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private AccountServiceImpl accountService;

    //todo  跳转到Order界面的方法，已失效
//    @LogAccount
//    @GetMapping("/newOrder")
//    public String newOrder(Model model) {
//        Order order = new Order();
//        session.setAttribute("order", order);
//        AccountVO account = (AccountVO) session.getAttribute("account");
//        model.addAttribute("loginAccount", account);
//        model.addAttribute("order", order);
//        session.setAttribute("loginAccount", account);
//        return "order/newOrder";
//    }

    // 查看用户的订单列表
    @LogAccount
    @GetMapping("/lists")
    @ResponseBody
    public CommonResponse<List<Order>> listOrders(@RequestHeader("Authorization") String token) {
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String username = (String) claims.get("username");
        return orderService.getOrdersByUsername(username);
    }

    // 查看根据订单id订单详情
    @LogAccount
    @GetMapping("/lists/{id}")
    @ResponseBody
    public CommonResponse<Order> viewOrderInformation(@PathVariable("id") String orderId) {
        Order order = orderMapper.selectById(orderId);
        return CommonResponse.createForSuccess("订单号为"+orderId+"的订单详情", order);
    }

    @LogAccount
    @PostMapping("")
    @ResponseBody
    public CommonResponse<Order> confirmOrder(@RequestBody Order order,@RequestHeader("Authorization") String token) {
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String username = (String) claims.get("username");
        order.setUserId(username);
        AccountVO account = accountService.getAccount(username).getData();

        orderService.insertOrder(order,account);
        return CommonResponse.createForSuccess("订单创建成功", order);
    }

    // 完成订单，更新库存
    @LogAccount
    @GetMapping("/{id}")
    @ResponseBody
    public CommonResponse<String> finishOrder(@PathVariable("id") Integer orderId,@RequestHeader("Authorization") String token) {
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String username = (String) claims.get("username");
        List<CartItem> cartItemList = cartService.getCartItemListByUserId(username).getData();
        orderService.finishOrder(orderId,cartItemList);
        return CommonResponse.createForSuccessMessage("订单已完成,库存已相应更新");
    }


    // 查看所有订单
    @LogAccount
    @GetMapping("/listOrder/{username}")
    @ResponseBody
    public CommonResponse<List<Order>> listOrder(@PathVariable("username") String username) {
        return orderService.getOrdersByUsername(username);
    }
}

