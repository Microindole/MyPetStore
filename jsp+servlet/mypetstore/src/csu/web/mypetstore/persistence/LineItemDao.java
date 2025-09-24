package csu.web.mypetstore.persistence;

import csu.web.mypetstore.domain.LineItem;

import java.util.List;

public interface LineItemDao {
    List<LineItem> getLineItemsByOrderId(int orderId);

    void insertLineItem(LineItem lineItem);

}
