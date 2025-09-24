package org.csu.petstore.service;

import org.csu.petstore.entity.Order;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItemListMapper;

import java.util.List;

public interface OrderService {

    public List<Order> getOrdersByUsername(String username);

    public int insertOrder(Order order, AccountVO account);

    void finishOrder(Order order, CartItemListMapper cartItemListMapper);



}
