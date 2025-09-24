package org.csu.petstore.service;

import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.Order;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItem;
import org.csu.petstore.vo.CartItemListMapper;
import java.util.List;

public interface OrderService {

    // 通过用户名获得订单列表
    CommonResponse<List<Order>> getOrdersByUsername(String username);

    void insertOrder(Order order, AccountVO account);

    void finishOrder(Integer orderId, List<CartItem> cartItemList);
}
