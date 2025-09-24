package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;


@Data
public class Item implements Serializable {
    private static final long serialVersionUID = 1L;


    @TableId(value = "itemid")
    private String itemId;
    @TableField(value = "productid")
    private String productId;
    @TableField(value = "listprice")
    private BigDecimal listPrice;
    @TableField(value = "unitcost")
    private BigDecimal unitCost;
    @TableField(value = "supplier")
    private int supplierId;
    private String status;
    @TableField(value = "attr1")
    private String attribute1;
    @TableField(value = "attr2")
    private String attribute2;
    @TableField(value = "attr3")
    private String attribute3;
    @TableField(value = "attr4")
    private String attribute4;
    @TableField(value = "attr5")
    private String attribute5;




//    private Product product;


//    private int quantity;
}
