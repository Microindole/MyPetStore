package org.csu.petstore.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("cart")
public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId("userid")
    private String userid;

    @TableField("itemid")
    private String itemId;

    @TableField("quantity")
    private Integer quantity;
}
