package csu.web.mypetstore.persistence.impl;

import csu.web.mypetstore.domain.LineItem;
import csu.web.mypetstore.persistence.DBUtil;
import csu.web.mypetstore.persistence.LineItemDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LineItemDaoImpl implements LineItemDao {

    private static final String GET_LINE_ITEMS_BY_ORDER_ID =
            "SELECT ORDERID,LINENUM AS lineNumber,ITEMID,QUANTITY,UNITPRICE FROM LINEITEM WHERE ORDERID = ?";
    private final String INSERT_LINE_ITEM =
            "INSERT INTO LINEITEM (ORDERID, LINENUM, ITEMID, QUANTITY, UNITPRICE)\n" +
                    "    VALUES (?, ?, ?, ?, ?)";


    @Override
    public List<LineItem> getLineItemsByOrderId(int orderId) {
        List<LineItem> lineItemList = new ArrayList<LineItem>();
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement ps = connection.prepareStatement(GET_LINE_ITEMS_BY_ORDER_ID);
            ps.setString(1, String.valueOf(orderId));
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                LineItem lineItem = new LineItem();
                lineItem.setOrderId(orderId);
                lineItem.setLineNumber(rs.getInt("lineNumber"));
                lineItem.setItemId(rs.getString("ITEMID"));
                lineItem.setQuantity(rs.getInt("QUANTITY"));
                lineItem.setUnitPrice(rs.getBigDecimal("UNITPRICE"));
                lineItemList.add(lineItem);
            }
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            DBUtil.closeConnection(connection);
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lineItemList;
    }

    @Override
    public void insertLineItem(LineItem lineItem) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_LINE_ITEM);
            preparedStatement.setInt(1, lineItem.getOrderId());
            preparedStatement.setString(2, String.valueOf(lineItem.getLineNumber()));
            preparedStatement.setString(3, String.valueOf(lineItem.getItemId()));
            preparedStatement.setInt(4, lineItem.getQuantity());
            preparedStatement.setBigDecimal(5, lineItem.getUnitPrice());
            int rows = preparedStatement.executeUpdate();
            if (rows > 0) {
                System.out.println("Insert LineItem success!");
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
