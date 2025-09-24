package org.csu.petstore.vo;

import lombok.Data;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Cart;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.LineItem;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Data
public class OrderVO {
    private int orderId;
    private String creditCard;
    private String expiryDate;
    private LocalDate date;
    private String cardType;
    private String courier;
    private String status;
    private String billToFirstName;
    private String billToLastName;
    private String billAddress1;
    private String billAddress2;
    private String billCity;
    private String billState;
    private String billZip;
    private String billCountry;
    private String shipToFirstName;
    private String shipToLastName;
    private String shipAddress1;
    private String shipAddress2;
    private String shipCity;
    private String shipState;
    private String shipZip;
    private String shipCountry;
    private boolean shippingAddressRequired;
    private Account account;
    private List<LineItem> lineItems;
    private List<CartItem> cartItemList;
    private List<Cart> cartList;
    private Item item;
    private BigDecimal totalPrice;
}
