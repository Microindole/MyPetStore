package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.LineItem;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LineItemMapper extends BaseMapper<LineItem> {

    List<LineItem> getLineItemsByOrderId(int orderId);

    void insertLineItem(LineItem lineItem);

    void deleteLineItems(int orderId);

}
