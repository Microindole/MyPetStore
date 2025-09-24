package org.csu.petstore.vo.admin;

import lombok.Data;
import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Product;

@Data
public class AdminProductVO {
    private Product product;
    private Category category;
    private Long itemCount;
}