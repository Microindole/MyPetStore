package org.csu.petstore.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.csu.petstore.annotation.LogAdmin;
import org.csu.petstore.entity.Order;
import org.csu.petstore.service.AdminOrderService;
import org.csu.petstore.vo.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    private AdminOrderService orderService;

    //获取订单
    @LogAdmin
    @GetMapping("/orders")
    public String getOrders(@SessionAttribute("admin") AdminVO adminVO , Model model) {
        model.addAttribute("admin",adminVO);
        List<Order> orders = orderService.getOrderList();
        model.addAttribute("orders", orders);
        return "order/orders";
    }

    @LogAdmin
    @GetMapping("/orders/{id}")
    @ResponseBody
    public String getOrder(@PathVariable("id") String orderId, Model model) {
        Order order = orderService.getOrder(Integer.parseInt(orderId));
        return JSON.toJSONString(order);
    }

    @LogAdmin
    @PostMapping("/shipOrder")
    public ResponseEntity<String> shipOrder(@RequestParam("orderId") Integer orderId) {
        System.out.println(11111);
        Order order=orderService.getOrder(orderId);
        System.out.println(orderId);
        orderService.updateOrderStatus(order);
        return ResponseEntity.ok("Success");
    }

    //修改订单
    @LogAdmin
    @PostMapping("/updateAddress")
    public ResponseEntity<String> updateAddress(@RequestBody JSONObject jsonParam) {
        System.out.println(jsonParam.toString());
        Order order=orderService.getOrder(Integer.parseInt(jsonParam.getString("orderId")));
        System.out.println(order.getOrderId());
        order.setShipAddr1(jsonParam.getString("shipAddress1"));
        order.setShipAddr2(jsonParam.getString("shipAddress2"));
        order.setShipCity(jsonParam.getString("shipCity"));
        order.setShipCountry(jsonParam.getString("shipCountry"));
        order.setShipState(jsonParam.getString("shipState"));
        order.setShipZip(jsonParam.getString("shipZip"));
        orderService.updateOrderAddress(order);
        return ResponseEntity.ok("Success");
    }


    //删除订单
    @LogAdmin
    @GetMapping("/deleteOrder")
    public String deleteOrder(String orderId, Model model) {
        orderService.deleteOrder(Integer.parseInt(orderId));
        List<Order> orders = orderService.getOrderList();
        model.addAttribute("orders", orders);
        return "redirect:orders";
    }

    @LogAdmin
    @GetMapping("/updateOut")
    public String updateOut(String orderId, Model model) {
        //System.out.println(orderId);
        orderService.updateOut(Integer.parseInt(orderId));
        List<Order> orders = orderService.getOrderList();
        model.addAttribute("orders", orders);
        return "redirect:/orders";
    }


    @LogAdmin
    @GetMapping("/ordersunsent")
    public String getUnSent( Model model) {
        List<Order> orders = orderService.getUnSentOrderList();
        model.addAttribute("orders", orders);
        return "/order/orders";
    }

}
