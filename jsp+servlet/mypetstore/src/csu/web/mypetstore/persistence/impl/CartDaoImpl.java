package csu.web.mypetstore.persistence.impl;

import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.CartItem;
import csu.web.mypetstore.domain.Item;
import csu.web.mypetstore.persistence.CartDao;
import csu.web.mypetstore.persistence.DBUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class CartDaoImpl implements CartDao {
    private static final String GET_CART_LIST_BY_USERNAME="SELECT itemId,quantity FROM cart WHERE username = ?";//查看item具体
    private static final String INSERT_CART="INSERT INTO cart(username,itemId,quantity) VALUES (?,?,?)";//商品到具体表
    private static final String UPDATE_CART_BY_USERNAME_ITEMID="UPDATE cart SET quantity = ? WHERE username = ? AND itemId=?";//商品到具体表
    private static final String DELETE_CART_BY_USERNAME_ITEMID="DELETE FROM cart WHERE username = ? AND itemId=?";//商品到具体表
    private static final String DELETE_CART_ALL="DELETE FROM cart WHERE username = ? ";//商品到具体表
    @Override
    public int insertCart(String username, String itemId,int quantity){
        int result = 0;
        Connection connection = null;
        try {
            connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,itemId);
            preparedStatement.setInt(3,quantity);
            //占位符类型一定要对应
            result = preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public int deleteCart(String username, String itemId){//可以直接用整形数据传进删除
        int result = 0;
        Connection connection = null;
        try {
            connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_BY_USERNAME_ITEMID);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,itemId);
            //占位符类型一定要对应
            result = preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public int deleteCartAll(String username){//可以直接用整形数据传进删除
        int result = 0;
        Connection connection = null;
        try {
            connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_ALL);
            preparedStatement.setString(1,username);
            //占位符类型一定要对应
            result = preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public  int  updateCart(String username, String itemId,int quantity){
        int result = 0;
        Connection connection = null;
        try {
            connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART_BY_USERNAME_ITEMID);
            preparedStatement.setInt(1,quantity);
            preparedStatement.setString(2,username);
            preparedStatement.setString(3,itemId);
            //占位符类型一定要对应
            result = preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public List<CartItem> selectCart(String username){
        int result = 0;
        Connection connection = null;
        List<CartItem> cartItemList = new ArrayList<>();
        try {
            connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CART_LIST_BY_USERNAME);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                CartItem cartItem =new CartItem();
                String itemId =resultSet.getString(1);
                Item item = new Item();
                item.setItemId(itemId);
                cartItem.setQuantity(resultSet.getInt(2));
                cartItem.setItem(item);
                cartItemList.add(cartItem);
            }
            DBUtil.closeResultSet(resultSet);//关闭结果集
            DBUtil.closeStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartItemList;
    }
}