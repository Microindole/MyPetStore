package org.csu.petstore.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.github.jeffreyning.mybatisplus.anno.MppMultiId;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@TableName("lineitem")
public class LineItem implements Serializable {
    private static final long serialVersionUID = 1L;

    @MppMultiId
    @TableField("orderid")
    private Integer orderId;
    @MppMultiId
    @TableField("linenum")
    private Integer lineNum;

    @TableField("itemid")
    private String itemId;

    @TableField("quantity")
    private Integer quantity;

    @TableField("unitprice")
    private BigDecimal unitPrice;
}
