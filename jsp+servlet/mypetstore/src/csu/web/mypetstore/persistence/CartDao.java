package csu.web.mypetstore.persistence;

import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.CartItem;
import csu.web.mypetstore.domain.Item;

import java.math.BigDecimal;
import java.util.List;

public interface CartDao {
    int insertCart(String username, String itemId,int quantity);
    int deleteCart(String username, String itemId);
    int deleteCartAll(String username);
    int updateCart(String username, String itemId,int quantity);
    List<CartItem> selectCart(String username);
}

