package org.csu.petstore.entity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("admin")
public class Admin {
    @TableId("adminname")
    private String username;
    @TableField("adminpassword")
    private String password;
}
