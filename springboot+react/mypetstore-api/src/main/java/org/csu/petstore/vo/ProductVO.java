package org.csu.petstore.vo;

import lombok.Data;
import org.csu.petstore.entity.Item;

import java.util.List;

@Data
public class ProductVO {

    private String productId;
    private String categoryId;
    private String productName;

    private List<Item> itemList;
}
