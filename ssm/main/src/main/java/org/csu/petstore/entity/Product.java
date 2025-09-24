package org.csu.petstore.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

@Data
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value = "productid")
    private String productId;
    @TableField("category")
    private String categoryId;
    private String name;
    @TableField("descn")
    private String description;

}
