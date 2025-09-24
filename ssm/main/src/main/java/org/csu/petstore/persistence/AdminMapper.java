package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper extends BaseMapper<Admin> {
}
