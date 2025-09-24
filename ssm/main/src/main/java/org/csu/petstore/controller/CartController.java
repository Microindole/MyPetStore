package org.csu.petstore.controller;


import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.LogAccount;
import org.csu.petstore.persistence.OrderMapper;
import org.csu.petstore.service.CartService;
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

@Controller
@RequestMapping("/cart")
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
    @GetMapping("/addItemToCart")
    public String addItemToCart(@RequestParam String workingItemId, Model model){
        AccountVO accountVO = (AccountVO) session.getAttribute("account");
        if (accountVO == null){
            return "account/signon";
        }else{
            String username = accountVO.getUsername();
            cartService.addItemToCart(username, workingItemId);
            return getString(model, username);
        }

    }
    @LogAccount
    @GetMapping("/viewCart")
    public String viewCart(Model model){
        AccountVO accountVO = (AccountVO) session.getAttribute("account");
        if (accountVO == null){
            return "account/signon";
        }
        String username = accountVO.getUsername();
        return getString(model, username);

    }

    // 删除商品项
    @LogAccount
    @GetMapping("/removeCartItem")
    public String removeCartItem(@RequestParam String workingItemId,Model model){
        AccountVO accountVO = (AccountVO) session.getAttribute("account");
        String username = accountVO.getUsername();
        cartService.removeItem(username, workingItemId);
        return getString(model, username);
    }


    // 更新购物车
    @LogAccount
    @PostMapping("/updateCart")
    public String updateCart(@RequestParam("itemIds") List<String> itemIds,
                             @RequestParam("quantities") List<Integer> quantities, Model model){
        AccountVO accountVO = (AccountVO) session.getAttribute("account");
        String username = accountVO.getUsername();
        for (String itemId : itemIds){
            int index = itemIds.indexOf(itemId);
            int quantity = quantities.get(index);
            cartService.updateCart(username,itemId,quantity);
        }
        CartItemListMapper cartItemListMapper = cartService.getCartItemListByUserId(username);
        List<CartItem> cartItemList = cartItemListMapper.getCartItemList();
        cartService.updateCartByCartItemList(cartItemList, username);
        model.addAttribute("cartItemListMapper", cartItemListMapper);
        session.setAttribute("cartItemListMapper", cartItemListMapper);
        return getString(model, username);
    }



    private String getString(Model model, String username) {
        CartItemListMapper cartItemListMapper = cartService.getCartItemListByUserId(username);
        List<CartItem> cartItemList = cartItemListMapper.getCartItemList();
        model.addAttribute("cartItemListMapper", cartItemListMapper);
        session.setAttribute("cartItemListMapper", cartItemListMapper);
        BigDecimal subTotal = BigDecimal.ZERO;
        int quantity = 0;
        for (CartItem cartItem : cartItemList){
            subTotal = subTotal.add(cartItem.getTotal());
            quantity += cartItem.getCart().getQuantity();
        }
        model.addAttribute("subTotal", subTotal);
        session.setAttribute("subTotal", subTotal);
        model.addAttribute("quantity", quantity);
        return "cart/cart";
    }

}
