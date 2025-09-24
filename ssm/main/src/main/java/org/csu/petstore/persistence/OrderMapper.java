package org.csu.petstore.persistence;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderMapper extends BaseMapper<Order> {

}
