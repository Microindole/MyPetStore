package org.csu.petstore.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;


@Data
public class AccountVO {
    @NotBlank(message = "用户名不能为空")
    private String username;
    @NotBlank(message = "密码 不能为空")
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String status;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String phone;
    private String langPref;
//    @TableField("favcategory")
    private String favoriteGory;
//    @TableField("mylistopt")
    private Integer myListOpt;
//    @TableField("banneropt")
    private Integer bannerOpt;
}
