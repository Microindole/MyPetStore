package org.csu.petstore.vo;


import lombok.Data;
import org.csu.petstore.entity.LineItem;

import java.util.List;

@Data
public class CartItemListMapper {

    private List<CartItem> cartItemList;

}
