package org.csu.petstore;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.Cart;
import org.csu.petstore.persistence.CartMapper;
import org.csu.petstore.service.CartService;
import org.csu.petstore.vo.CartItem;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class ServiceTest {

    @Autowired
    private CartService cartService;

    @Autowired
    private CartMapper cartMapper;

    @Test
    void Test1(){
        String username = "ffff";
        String itemId = "EST-4";
        cartService.clearCart(username);
    }
}
