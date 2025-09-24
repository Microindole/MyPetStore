package org.csu.petstore.service;


import org.csu.petstore.entity.Cart;
import org.csu.petstore.vo.CartItem;
import org.csu.petstore.vo.CartItemListMapper;

import java.util.List;

public interface CartService {

    public List<Cart> getCartListByUserId(String userId);

    public Cart createCart(String username);

    public CartItemListMapper getCartItemListByUserId(String userId);

    public void addItemToCart(String username, String itemId);

    public void updateCart(String username, String itemId, int quantity);

    public void removeItem(String username, String itemId);

    public void clearCart(String username);

    public void updateCartByCartItemList(List<CartItem> cartItemList, String userid);
}
