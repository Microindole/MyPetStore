package org.csu.petstore.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.github.jeffreyning.mybatisplus.anno.MppMultiId;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;

@Data
@TableName("orderstatus")
public class OrderStatus implements Serializable {
    private static final long serialVersionUID = 1L;

    @MppMultiId
    @TableField("orderid")
    private Integer orderId;
    @MppMultiId
    @TableField("linenum")
    private Integer lineNum;

    @TableField("timestamp")
    private LocalDate timestamp;

    @TableField("status")
    private String status;
}
