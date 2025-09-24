package org.csu.petstore.service;


import org.csu.petstore.entity.Cart;
import org.csu.petstore.vo.CartItem;
import org.csu.petstore.vo.CartItemListMapper;

import java.util.List;

public interface CartService {

    // 通过用户获取数据库表中的购物车
    List<Cart> getCartListByUserId(String userId);

    // 获取购物车内商品
    CartItemListMapper getCartItemListByUserId(String userId);

    void addItemToCart(String username, String itemId);

    void updateCart(String username, String itemId, int quantity);

    void removeItem(String username, String itemId);

    void clearCart(String username);

    // 通过购物车内商品更新购物车
    void updateCartByCartItemList(List<CartItem> cartItemList, String userid);
}
