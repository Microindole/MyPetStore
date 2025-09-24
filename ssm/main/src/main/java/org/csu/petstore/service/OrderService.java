package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Cart;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.Order;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItem;
import org.csu.petstore.vo.CartItemListMapper;
import org.csu.petstore.vo.OrderVO;

import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;

public interface OrderService {

    // 通过用户名获得订单列表
    List<Order> getOrdersByUsername(String username);

    int insertOrder(Order order, AccountVO account);

    void finishOrder(Order order, CartItemListMapper cartItemListMapper);

    Order setOrder(Order order, AccountVO account);



}
