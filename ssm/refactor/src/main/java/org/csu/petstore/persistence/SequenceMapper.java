package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Sequence;
import org.springframework.stereotype.Repository;

@Repository
public interface SequenceMapper extends BaseMapper<Sequence>{
}
