package org.csu.petstore.vo;

import lombok.Data;
import org.csu.petstore.entity.Cart;
import org.csu.petstore.entity.Item;

import java.math.BigDecimal;
import java.util.List;

@Data
public class CartItem {
    private ItemVO itemVO;
    private Cart cart;
    private int inStock;
    private BigDecimal total;

}
