package org.csu.petstore.persistence;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;
import org.csu.petstore.entity.Cart;
import org.springframework.stereotype.Repository;


@Repository
public interface CartMapper extends BaseMapper<Cart> {

    @Update("UPDATE cart SET quantity=#{quantity} WHERE userid=#{userid} AND itemid=#{itemid}")
    void updateCart(String userid,String itemid,Integer quantity);

    @Delete("DELETE FROM cart WHERE userid=#{userid} AND itemid=#{itemId}")
    void deleteCart(String userid,String itemId);

}
