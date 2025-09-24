package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.ItemQuantity;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemQuantityMapper extends BaseMapper<ItemQuantity> {
}
