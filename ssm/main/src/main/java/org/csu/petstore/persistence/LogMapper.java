package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Log;
import org.springframework.stereotype.Repository;

@Repository
public interface LogMapper extends BaseMapper<Log> {
}
