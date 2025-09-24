package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.SignOn;
import org.springframework.stereotype.Repository;

@Repository
public interface SignOnMapper extends BaseMapper<SignOn> {
}
