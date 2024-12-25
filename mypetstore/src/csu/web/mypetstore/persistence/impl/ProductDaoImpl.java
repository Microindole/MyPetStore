//package csu.web.mypetstore.persistence.impl;
//
//import csu.web.mypetstore.domain.Product;
//import csu.web.mypetstore.persistence.DBUtill;
//import csu.web.mypetstore.persistence.ProductDao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ProductDaoImpl implements ProductDao {
//    private static final String getProductListByCategoryString =
//            "SELECT PRODUCTID,NAME,DESCN as description,CATEGORY as categoryId FROM PRODUCT WHERE CATEGORY=?";
//    private static final String getProductString =
//            "SELECT PRODUCTID,NAME,DESCN as description,CATEGORY as categoryId FROM PRODUCT WHERE PRODUCTID =?";
//    private static final String searchProductListString =
//            "SELECT PRODUCTID,NAME,DESCN as description,CATEGORY as categoryId FROM PRODUCT WHERE lower(name) like ?";
//    @Override
//    public List<Product> getProductListByCategory(String categoryId) {
//        List<Product> products = new ArrayList<Product>();
//        try {
//            Connection connection = DBUtill.getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement(getProductListByCategoryString);
//            preparedStatement.setString(1, categoryId);
//            ResultSet resultSet = preparedStatement.executeQuery(getProductListByCategoryString);
//            while (resultSet.next()) {
//                Product product = new Product();
//                product.setCategoryId(resultSet.getString(1));
//                product.setName(resultSet.getString(2));
//                product.setDescription(resultSet.getString(3));
//                product.setCategoryId(resultSet.getString(4));
//                products.add(product);
//            }
//            DBUtill.closeResultSet(resultSet);
//            DBUtill.closePreparedStatement(preparedStatement);
//            DBUtill.closeConnection(connection);
//        }catch (Exception e) {
//            e.printStackTrace();
//        }
//        return products;
//
//    }
//
//    @Override
//    public Product getProduct(String productId) {
//        Product product = null;
//        try {
//            Connection connection = DBUtill.getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement(getProductString);
//            preparedStatement.setString(1, productId);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            if (resultSet.next()) {
//                product = new Product();
//                product.setProductId(resultSet.getString("PRODUCTID"));
//                product.setName(resultSet.getString("NAME"));
//                product.setDescription(resultSet.getString("description"));
//                product.setCategoryId(resultSet.getString("categoryId"));
//            }
//            DBUtill.closeResultSet(resultSet);
//            DBUtill.closeStatement(preparedStatement);
//            DBUtill.closeConnection(connection);
//
//        }catch (Exception e) {
//            e.printStackTrace();
//        }
//        return product;
//
//
//
//
//    }
//
//    @Override
//    public List<Product> searchProductList(String keywords) {
//        List<Product> productList = new ArrayList<Product>();
//        try {
//            Connection connection = DBUtill.getConnection();
//            PreparedStatement preparedStatement = connection
//                    .prepareStatement(searchProductListString);
//            preparedStatement.setString(1, keywords);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                Product product = new Product();
//                product.setProductId(resultSet.getString("PRODUCTID"));
//                product.setName(resultSet.getString("NAME"));
//                product.setDescription(resultSet.getString("description"));
//                product.setCategoryId(resultSet.getString("categoryId"));
//                productList.add(product);
//            }
//            DBUtill.closeResultSet(resultSet);
//            DBUtill.closeStatement(preparedStatement);
//            DBUtill.closeConnection(connection);
//        }catch (Exception e) {
//            e.printStackTrace();
//        }
//        return productList;
//    }
//}

package csu.web.mypetstore.persistence.impl;

import csu.web.mypetstore.domain.Product;
import csu.web.mypetstore.persistence.DBUtil;
import csu.web.mypetstore.persistence.ProductDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {

    private static final String getProductListByCategoryString =
            "SELECT PRODUCTID,NAME,DESCN as description,CATEGORY as categoryId FROM PRODUCT WHERE CATEGORY=?";
    private static final String getProductString =
            "SELECT PRODUCTID,NAME,DESCN as description,CATEGORY as categoryId FROM PRODUCT WHERE PRODUCTID = ?";
    private static final String searchProductListString =
            "SELECT PRODUCTID,NAME,DESCN as description,CATEGORY as categoryId from PRODUCT WHERE lower(name) like ?";

    @Override
    public List<Product> getProductListByCategory(String categoryId) {
        List<Product> products = new ArrayList<Product>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection
                    .prepareStatement(getProductListByCategoryString);
            pStatement.setString(1, categoryId);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getString(1));
                product.setName(resultSet.getString(2));
                product.setDescription(resultSet.getString(3));
                product.setCategoryId(resultSet.getString(4));
                products.add(product);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public Product getProduct(String productId) {
        Product product = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection
                    .prepareStatement(getProductString);
            pStatement.setString(1, productId);
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()) {
                product = new Product();
                product.setProductId(resultSet.getString(1));
                product.setName(resultSet.getString(2));
                product.setDescription(resultSet.getString(3));
                product.setCategoryId(resultSet.getString(4));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    @Override
    public List<Product> searchProductList(String keywords) {
        List<Product> productList = new ArrayList<Product>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection
                    .prepareStatement(searchProductListString);
            preparedStatement.setString(1, keywords);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getString("PRODUCTID"));
                product.setName(resultSet.getString("NAME"));
                product.setDescription(resultSet.getString("description"));
                product.setCategoryId(resultSet.getString("categoryId"));
                productList.add(product);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }
}
