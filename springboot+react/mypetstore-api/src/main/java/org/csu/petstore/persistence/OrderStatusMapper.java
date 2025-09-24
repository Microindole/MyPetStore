package org.csu.petstore.persistence;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.OrderStatus;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderStatusMapper extends BaseMapper<OrderStatus> {
}
