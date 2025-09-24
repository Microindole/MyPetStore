package org.csu.petstore.persistence;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Order;
import org.csu.petstore.entity.OrderStatus;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminOrderStatusMapper extends BaseMapper<OrderStatus> {
    void updateOrderStatus(Order order);
}
