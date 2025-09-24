package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Item;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemMapper extends BaseMapper<Item> {
}
