package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;


@Data
@TableName("inventory")
public class ItemQuantity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "itemid")
    private String itemId;
    @TableField(value = "qty")
    private Integer quantity;
}
