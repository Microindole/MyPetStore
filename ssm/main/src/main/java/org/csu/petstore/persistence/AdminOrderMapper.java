package org.csu.petstore.persistence;

import org.csu.petstore.entity.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminOrderMapper {

    List<Order> getOrderList();

    List<Order> getOrdersByUsername(String username);

    Order getOrder(int orderId);

    void insertOrder(Order order);

    void insertOrderStatus(Order order);

    void updateOrderStatus(Order order);

    void updateOrderAddress(Order order);

    void deleteOrder(int orderId);

    void deleteOrderStatus(int orderId);

    void updateOut(int orderId);

    int getOrderNumber();

    int getUnSentNumber();

    int getTodayOrderNumber(String day);

    int getAlreadyNumber();

    List<Order> getUnSentOrderList();
}
