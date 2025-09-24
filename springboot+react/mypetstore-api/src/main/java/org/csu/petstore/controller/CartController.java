package org.csu.petstore.controller;


import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.LogAccount;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.persistence.OrderMapper;
import org.csu.petstore.service.CartService;
import org.csu.petstore.utils.JwtUtil;
import org.csu.petstore.vo.AccountVO;
import org.csu.petstore.vo.CartItem;
import org.csu.petstore.vo.CartItemListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private HttpSession session;

    @Qualifier("orderMapper")
    @Autowired
    private OrderMapper orderMapper;


    // 将商品项加入购物车
    @LogAccount
    @GetMapping("/{id}")
    @ResponseBody
    public CommonResponse<String> addItemToCart(@PathVariable("id") String workingItemId,@RequestHeader("Authorization") String token){
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String username = (String) claims.get("username");
        cartService.addItemToCart(username, workingItemId);
//            updateQuantityAndSubtotal(username);
        return CommonResponse.createForSuccessMessage("商品项" + workingItemId + "已加入购物车");

    }

    // 查看购物车
    @LogAccount
    @GetMapping("")
    @ResponseBody
    public CommonResponse<List<CartItem>> viewCart(@RequestHeader("Authorization") String token){
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String username = (String) claims.get("username");
        return cartService.getCartItemListByUserId(username);

    }

    // 删除商品项
    @LogAccount
    @DeleteMapping("/{id}")
    @ResponseBody
    public CommonResponse<List<CartItem>> removeCartItem(@PathVariable("id") String workingItemId,@RequestHeader("Authorization") String token){
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String username = (String) claims.get("username");
        cartService.removeItem(username, workingItemId);
//        updateQuantityAndSubtotal(username);
        return CommonResponse.createForSuccess("商品"+workingItemId+"已从购物车中删除", cartService.getCartItemListByUserId(username).getData());
    }

    // 更新购物车
    @LogAccount
    @PostMapping("")
    @ResponseBody
    public CommonResponse<List<CartItem>> updateCart(@RequestParam("itemId") String itemId,
                                                     @RequestParam("quantity") Integer quantity,
                                                     @RequestHeader("Authorization") String token){
        Map<String, Object> claims = JwtUtil.parseToken(token);
        String username = (String) claims.get("username");
        if(quantity < 1){
            cartService.removeItem(username, itemId);
        }else{
            cartService.updateCart(username,itemId,quantity);
        }
        List<CartItem> cartItemList = cartService.getCartItemListByUserId(username).getData();
//        updateQuantityAndSubtotal(username);
        return CommonResponse.createForSuccess("购物车已更新",cartService.getCartItemListByUserId(username).getData());
    }


    // todo 该函数的作用是在使用thymeleaf的情况下 , 计算购物车的总价和 总的商品数量  注意：前端要另外算 quantity和subTotal
    private void updateQuantityAndSubtotal(String username) {
        List<CartItem> cartItemList = cartService.getCartItemListByUserId(username).getData();
        BigDecimal subTotal = BigDecimal.ZERO;
        int quantity = 0;
        for (CartItem cartItem : cartItemList){
            subTotal = subTotal.add(cartItem.getTotal());
            quantity += cartItem.getCart().getQuantity();
        }
        session.setAttribute("subTotal", subTotal);
        session.setAttribute("quantity", quantity);
    }

}
