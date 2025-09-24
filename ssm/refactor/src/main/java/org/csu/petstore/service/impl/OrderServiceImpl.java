package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.*;
import org.csu.petstore.persistence.*;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItem;
import org.csu.petstore.vo.CartItemListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private OrderStatusMapper orderStatusMapper;

    @Autowired
    private LineItemMapper lineItemMapper;

    @Autowired
    private ItemQuantityMapper itemQuantityMapper;


    @Override
    public List<Order> getOrdersByUsername(String username) {
       return orderMapper.selectList(new QueryWrapper<Order>().eq("userid", username));
    }

    @Override
    public int insertOrder(Order order,AccountVO account) {
        LocalDate dateNow = LocalDate.now();
        order.setOrderDate(dateNow);
        if(order.getShipAddr1() == ""){
            order.setShipAddr1(account.getAddress1());
        }if(order.getShipCity() == ""){
            order.setShipCity(account.getCity());
        }if (order.getShipState() == ""){
            order.setShipState(account.getState());
        }if (order.getShipZip()==""){
            order.setShipZip(account.getZip());
        }if (order.getShipCountry()==""){
            order.setShipZip(account.getZip());
        }if(order.getShipToFirstname()==""){
            order.setShipToFirstname(account.getFirstName());
        }if(order.getShipToLastname()==""){
            order.setShipToLastname(account.getLastName());
        }order.setCreditCard("999 9999 9999 9999");
        order.setExpiryDate(dateNow.plusWeeks(2).toString());
        order.setCourier("UPS");
        order.setLocale("CA");
        orderMapper.insert(order);
        return order.getOrderId();
    }

    @Override
    public void finishOrder(Order order, CartItemListMapper cartItemListMapper) {
        OrderStatus orderStatus = new OrderStatus();
        int orderId = order.getOrderId();
        orderStatus.setOrderId(orderId);
        orderStatus.setLineNum(1);
        orderStatus.setTimestamp(LocalDate.now());
        orderStatus.setStatus("P");
        orderStatusMapper.insert(orderStatus);
        List<LineItem> lineItemList = new ArrayList<>();
        List<CartItem> cartItemList = cartItemListMapper.getCartItemList();
        for (CartItem cartItem : cartItemList){
            LineItem lineItem = new LineItem();
            ItemQuantity itemQuantity = new ItemQuantity();
            int index = cartItemList.indexOf(cartItem) + 1;
            int quantity = cartItem.getCart().getQuantity();
            String itemId = cartItem.getCart().getItemId();
            lineItem.setOrderId(orderId);
            lineItem.setItemId(itemId);
            lineItem.setLineNum(index);
            lineItem.setQuantity(quantity);
            lineItem.setUnitPrice(cartItem.getItemVO().getListPrice());
            lineItemMapper.insert(lineItem);
            itemQuantity.setItemId(itemId);
            itemQuantity.setQuantity(itemQuantityMapper.selectById(itemId).getQuantity() - quantity);
            itemQuantityMapper.updateById(itemQuantity);
        }
    }


}





