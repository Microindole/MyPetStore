package csu.web.mypetstore.service;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.CartItem;
import csu.web.mypetstore.domain.Item;
import csu.web.mypetstore.persistence.CartDao;
import csu.web.mypetstore.persistence.ItemDao;
import csu.web.mypetstore.persistence.impl.CartDaoImpl;
import csu.web.mypetstore.persistence.impl.ItemDaoImpl;

import java.math.BigDecimal;
import java.util.*;

public class CartService {
    private CartDao cartDao;
    private ItemDao itemDao;
    public CartService(){
        cartDao=new CartDaoImpl();
        itemDao=new ItemDaoImpl();
    }
    public void insertCart(Account account, CartItem cartItem){
        cartDao.insertCart(account.getUsername(),cartItem.getItem().getItemId(),cartItem.getQuantity());
    }
    public void updateCart(Account account,CartItem cartItem){
        cartDao.updateCart(account.getUsername(),cartItem.getItem().getItemId(),cartItem.getQuantity());
    }
    public void updateCart(Account account, Item item){
        cartDao.updateCart(account.getUsername(),item.getItemId(),item.getQuantity());
    }
    public void deleteCart(Account account,String itemId){
        cartDao.deleteCart(account.getUsername(),itemId);
    }
    public void deleteCartAll(Account account){
        cartDao.deleteCartAll(account.getUsername());
    }
    public List<CartItem> getCartItems(Account account){
        List<CartItem> CartList=cartDao.selectCart(account.getUsername());
        for (CartItem cartItem:CartList
        ) {
            String itemId=cartItem.getItem().getItemId();
            cartItem.setItem(itemDao.getItem(itemId));
        }
        return CartList;
    }

    public Cart getCartByAccount(Account account){
        Cart cart = new Cart();
        cart.addItems(getCartItems(account));
        return cart;
    }

}
