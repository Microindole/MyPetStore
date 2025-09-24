package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.LineItem;
import org.springframework.stereotype.Repository;

@Repository
public interface LineItemMapper extends BaseMapper<LineItem> {
}
