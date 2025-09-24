package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
@Data
public class Sequence implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableField("name")
    private String name;
    @TableId("nextid")
    private int nextId;


}
