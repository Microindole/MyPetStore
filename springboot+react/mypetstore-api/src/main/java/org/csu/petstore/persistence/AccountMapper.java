package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.csu.petstore.entity.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountMapper extends BaseMapper<Account> {
}
