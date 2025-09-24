package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("profile")
public class Profile implements Serializable {
    private static final long serialVersionUID = 1L;


    @TableId("userid")
    private String userid;

    @TableField("langpref")
    private String langPref;

    @TableField("favcategory")
    private String favoriteGory;

    @TableField("mylistopt")
    private Integer myListOpt;

    @TableField("banneropt")
    private Integer bannerOpt;
}
