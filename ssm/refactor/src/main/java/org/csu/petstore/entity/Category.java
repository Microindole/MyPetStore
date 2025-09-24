package org.csu.petstore.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("category")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;


    @TableId(value = "catid")
    private String categoryId;
    private String name;
    @TableField("descn")
    private String description;
}
