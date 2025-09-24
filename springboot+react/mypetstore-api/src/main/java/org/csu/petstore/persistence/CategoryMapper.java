package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Category;
import org.springframework.stereotype.Repository;


@Repository
public interface CategoryMapper extends BaseMapper<Category> {
}
