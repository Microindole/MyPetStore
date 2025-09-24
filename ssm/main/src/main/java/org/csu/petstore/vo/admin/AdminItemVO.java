package org.csu.petstore.vo.admin;

import lombok.Data;
import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.Product;

@Data
public class AdminItemVO {
    private Item item;
    private Product product;
    private Category category;
    private Integer quantity;
}