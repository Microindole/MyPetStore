package org.csu.petstore.persistence;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Profile;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileMapper extends BaseMapper<Profile> {
}
