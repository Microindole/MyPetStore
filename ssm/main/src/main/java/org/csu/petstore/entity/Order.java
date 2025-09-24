package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@TableName("orders")
public class Order implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(value="orderid",type = IdType.AUTO)
    private Integer orderId;
//    private String username;
    private String outStatus;
    @TableField("userid")
    private String userId;

    @TableField("orderdate")
    private LocalDate orderDate;

    @TableField("shipaddr1")
    private String shipAddr1;

    @TableField("shipaddr2")
    private String shipAddr2;

    @TableField("shipcity")
    private String shipCity;

    @TableField("shipstate")
    private String shipState;

    @TableField("shipzip")
    private String shipZip;

    @TableField("shipcountry")
    private String shipCountry;

    @TableField("billaddr1")
    private String billAddr1;

    @TableField("billaddr2")
    private String billAddr2;

    @TableField("billcity")
    private String billCity;

    @TableField("billstate")
    private String billState;

    @TableField("billzip")
    private String billZip;

    @TableField("billcountry")
    private String billCountry;

    @TableField("courier")
    private String courier;

    @TableField("totalprice")
    private BigDecimal totalPrice;

    @TableField("billtofirstname")
    private String billToFirstname;

    @TableField("billtolastname")
    private String billToLastname;

    @TableField("shiptofirstname")
    private String shipToFirstname;

    @TableField("shiptolastname")
    private String shipToLastname;

    @TableField("creditcard")
    private String creditCard;

    @TableField("exprdate")
    private String expiryDate;

    @TableField("cardtype")
    private String cardType;

    @TableField("locale")
    private String locale;


//    public String getOutStatus() {
//        return outStatus;
//    }
//
//    public void setOutStatus(String outStatus) {
//        this.outStatus = outStatus;
//    }
//
//    private List<LineItem> lineItems = new ArrayList<LineItem>();



//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username;
//    }

    public Date getOrderDate() {
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = orderDate.atStartOfDay(zoneId);
        Date date = Date.from(zdt.toInstant());
        return date;
    }
}
