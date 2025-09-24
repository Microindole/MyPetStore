package csu.web.mypetstore.persistence.impl;

import csu.web.mypetstore.domain.*;
import csu.web.mypetstore.persistence.AccountDao;
import csu.web.mypetstore.persistence.DBUtil;
import csu.web.mypetstore.persistence.ItemDao;
import csu.web.mypetstore.persistence.ProductDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class AccountDaoImpl implements AccountDao {

////    public static void main(String[] args) {
////    AccountDao accountDao = new AccountDaoImpl();
////    Account account = new Account();
////    account.setUsername("j2ee");
////    account.setPassword("j2ee");
////    Account result = accountDao.getAccountByUsernameAndPassword(account);
////    System.out.println("success");
////    }


    private static final String INSERT_SHOPPINGCART="INSERT INTO shoppingcart VALUES (?,?,?,?,?,?,?,?,?,?)";
    private static final String INSERT_SHOPPINGCART2="INSERT INTO shoppingcart VALUES (?,?,?,?,?,?,?,?,?,?)";
    private static final String DELETE_SHOPPINGCART_BY_USERNAME_AND_ITEMID="delete  from shoppingcart where userid = ? and itemid=? ";
    private static final String DELETE_SHOPPINGCART_BY_USERNAME="delete  from shoppingcart where userid = ? ";
    private static final String SELECT_SHOPPINGCART_BY_USERNAME_AND_ITEMID="select * from shoppingcart where userid = ? and itemid = ?";
    private static final String SELECT_SHOPPINGCART_BY_USERNAME="select * from shoppingcart where userid = ? and times = ?";
    private static final String SELECT_SHOPPINGCART="select * from shoppingcart";
    private static final String SELECT_SHOPPINGCART_BY_USERNAME_AND_TIMES="select * from shoppingcart where userid = ? and times = 1";
    private static final String UPDATE_SHOPPINGCART_BY_QUANTITY="update shoppingcart set quantity = ? where userid = ? and itemid = ?";
    private static final String UPDATE_SHOPPINGCART_BY_ADDRESS="update shoppingcart set address = ? where userid = ? and itemid = ?";


    //UPDATE users SET age = 30 WHERE id = 1;
    private static final String UPDATE_USERHISTORYCATE=
            "UPDATE history SET category=? WHERE visittimes=0 AND userid=? AND addtocarttimes=0";//添加描述AND addtocarttimes=0
    private static final String UPDATE_USERHISTORYVISIT=
            "UPDATE history SET visittimes=? WHERE userid=? AND category=?";
    private static final String UPDATE_USERHISTORYCARTVISIT=
            "UPDATE history SET addtocarttimes=? WHERE userid=? AND category=?";
    private static final String INIT_USERHISTORY=
            "INSERT INTO history (userid,category) VALUES (?,?)";
    private static final String INIT_USERHISTORYNUM=
            "UPDATE history SET visittimes=? WHERE userid=? and category=?";
    private static final String INIT_USERHISTORYCART=
            "UPDATE history SET addtocarttimes=? WHERE userid=? and category=?";
    private static final String GET_HISTORYITEMNUM="select * from history where HISTORY.USERID =? AND HISTORY.CATEGORY=?";
    private static final String SELECT_ACCOUNT_BY_HISTORYUSERNAMEANDITEMID="select * from history where HISTORY.USERID = ? AND HISTORY.CATEGORY=?";



    private static final String INSERT_USERREGISTER=
            "INSERT INTO signon VALUES (?,?)";

    private static final String INSERT_USERINFORMATION=
            "INSERT INTO account VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

    private static final String INSERT_PROFILE=
            "INSERT INTO profile VALUES (?,?,?,?,?)";

    private static final String GET_ACCOUNT_BY_USERNAME_AND_PASSWORD="SELECT SIGNON.USERNAME," +
            "ACCOUNT.EMAIL,ACCOUNT.FIRSTNAME,ACCOUNT.LASTNAME,ACCOUNT.STATUS," +
            "ACCOUNT.ADDR1 AS address1,ACCOUNT.ADDR2 AS address2," +
            "ACCOUNT.CITY,ACCOUNT.STATE,ACCOUNT.ZIP,ACCOUNT.COUNTRY,ACCOUNT.PHONE," +
            "PROFILE.LANGPREF AS languagePreference,PROFILE.FAVCATEGORY AS favouriteCategoryId," +
            "PROFILE.MYLISTOPT AS listOption,PROFILE.BANNEROPT AS bannerOption," +
            "BANNERDATA.BANNERNAME FROM ACCOUNT, PROFILE, SIGNON, BANNERDATA " +
            "WHERE ACCOUNT.USERID = ? AND SIGNON.PASSWORD = ? AND SIGNON.USERNAME = ACCOUNT.USERID" +
            " AND PROFILE.USERID = ACCOUNT.USERID" +
            " AND PROFILE.FAVCATEGORY = BANNERDATA.FAVCATEGORY";

    private static final String SELECT_ACCOUNT_BY_ACCOUNTUSERNAME="select * from account where ACCOUNT.USERID = ?";
    private static final String SELECT_ACCOUNT_BY_SIGNONUSERNAME="select * from signon where SIGNON.USERNAME = ?";
    private static final String SELECT_ACCOUNT_BY_SIGNONPASSWORD="select * from signon where SIGNON.PASSWORD = ?";
    private static final String GET_ACCOUNT_BY_USERNAME="select * from signon where SIGNON.USERNAME =?";
    private static final String UPDATE_ACCOUNT = "UPDATE ACCOUNT SET EMAIL = ?,FIRSTNAME = ?,LASTNAME = ?,STATUS = ?,ADDR1 = ?,ADDR2 = ?,CITY = ?,STATE = ?,ZIP = ?,COUNTRY = ?,PHONE = ? WHERE USERID = ?";
    private static final String UPDATE_SIGNON = "UPDATE SIGNON SET STATUS = ? WHERE USERID = ?";
    private static final String UPDATE_PROFILE = "UPDATE PROFILE SET LANGPREF = ?,FAVCATEGORY = ? WHERE USERID = ?";



    @Override
    public Account getAccountByUsername(String username) {
        Account accountResult = new Account();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ACCOUNT_BY_USERNAME);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            this.resultSetToAccount(accountResult,resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountResult;
    }

    @Override
    public Account getAccountByUsernameAndPassword(Account account) {
        Account accountResult = new Account();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ACCOUNT_BY_USERNAME_AND_PASSWORD);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            this.resultSetToAccount(accountResult,resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountResult;
    }




    private void resultSetToAccount(Account accountResult,ResultSet resultSet) throws Exception {
        while(resultSet.next()) {
            accountResult.setUsername(resultSet.getString("USERNAME"));
            accountResult.setEmail(resultSet.getString("EMAIL"));
            accountResult.setFirstName(resultSet.getString("FIRSTNAME"));
            accountResult.setLastName(resultSet.getString("LASTNAME"));
            accountResult.setStatus(resultSet.getString("STATUS"));
            accountResult.setAddress1(resultSet.getString("ADDRESS1"));
            accountResult.setAddress2(resultSet.getString("ADDRESS2"));
            accountResult.setCity(resultSet.getString("CITY"));
            accountResult.setState(resultSet.getString("STATE"));
            accountResult.setZip(resultSet.getString("ZIP"));
            accountResult.setCountry(resultSet.getString("COUNTRY"));
            accountResult.setPhone(resultSet.getString("PHONE"));
            accountResult.setLanguagePreference(resultSet.getString("languagePreference"));
            accountResult.setFavouriteCategoryId(resultSet.getString("favouriteCategoryId"));
            accountResult.setListOption(resultSet.getInt("listOption")==1?true:false);
            accountResult.setBannerOption(resultSet.getInt("bannerOption")==1?true:false);
            accountResult.setBannerName(resultSet.getString("bannername"));
        }
    }



    private void resultSetToHistory(History history, ResultSet resultSet) throws Exception {
        while(resultSet.next()) {
            history.setUsername(resultSet.getString("userid"));
            history.setCategory(resultSet.getString("category"));
            history.setAddtocarttimes(resultSet.getInt("addtocarttimes"));

            history.setVisittimes(resultSet.getInt("visittimes"));

        }
    }





//    private void resultSetToHistory(History history, ResultSet resultSet) throws Exception {
//        while(resultSet.next()) {
//            history.setUsername(resultSet.getString("userid"));
//            history.setCategory(resultSet.getString("category"));
//
//            history.setVisittimes(resultSet.getInt("visittimes"));
//
//        }
//    }


    @Override
    public boolean insertAccount(Account account) {
//补充全部信息
        try{
            Connection connection= DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USERINFORMATION);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,account.getEmail());
            preparedStatement.setString(3,account.getFirstName());
            preparedStatement.setString(4,account.getLastName());
            preparedStatement.setString(5,account.getStatus());
            preparedStatement.setString(6,account.getAddress1());
            preparedStatement.setString(7,account.getAddress2());
            preparedStatement.setString(8,account.getCity());
            preparedStatement.setString(9,account.getState());
            preparedStatement.setString(10,account.getZip());
            preparedStatement.setString(11,account.getCountry());
            preparedStatement.setString(12,account.getPhone());

            int result=preparedStatement.executeUpdate();
            if(result>0) {
                return true;
            }

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }
    @Override
    public void insertProfile(Account account) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_PROFILE);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,account.getLanguagePreference());//"chinese"
            preparedStatement.setString(3,account.getFavouriteCategoryId());//"favcategory"
            preparedStatement.setInt(4,1);//"mylistopt"
            preparedStatement.setInt(5,1);//"banneropt"
            int rows=preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Override
    public void insertSignon(Account account) {
//进行注册操作
        boolean result= false;
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USERREGISTER);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,account.getPassword());


            int rows=preparedStatement.executeUpdate();
            if(rows==1){
                result=true;
            }

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e){
            e.printStackTrace();
        }

        //return result;
    }

    @Override
    public void updateAccount(Account account) {
        try {
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ACCOUNT);
            preparedStatement.setString(1,account.getEmail());
            preparedStatement.setString(2,account.getFirstName());
            preparedStatement.setString(3,account.getLastName());
            preparedStatement.setString(4,account.getStatus());
            preparedStatement.setString(5,account.getAddress1());
            preparedStatement.setString(6,account.getAddress2());
            preparedStatement.setString(7,account.getCity());
            preparedStatement.setString(8,account.getState());
            preparedStatement.setString(9,account.getZip());
            preparedStatement.setString(10,account.getCountry());
            preparedStatement.setString(11,account.getPhone());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    @Override
    public void updateProfile(Account account) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_PROFILE);
            preparedStatement.setString(1,account.getLanguagePreference());
            preparedStatement.setString(2,account.getFavouriteCategoryId());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    @Override
    public void updateSignon(Account account) {
        try {
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_SIGNON);
            preparedStatement.setString(1,account.getPassword());
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public boolean selectAccountByUsername(String username) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ACCOUNT_BY_SIGNONUSERNAME);
            preparedStatement.setString(1,username);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()) {
                return true;
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;

    }
    @Override
    public boolean selectAccountByPassword(String password) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ACCOUNT_BY_SIGNONPASSWORD);
            preparedStatement.setString(1,password);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()) {
                return true;
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }










    @Override
    public void insertHistroyUser(Account account, String itemid) {

        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_USERHISTORYCATE);
            preparedStatement.setString(1,itemid);
            preparedStatement.setString(2,account.getUsername());
            int rows=preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public void insertHistroyUserId(Account account, String itemName) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INIT_USERHISTORY);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,itemName);


            int rows=preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public boolean findHistoryByUsernameandCategory(String username, String categoryName) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_BY_HISTORYUSERNAMEANDITEMID);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, categoryName);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()) {
                return true;
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void UpdateVisitNum(Account account, String itemid) {
        History history=getHistoryByUsername(account.getUsername(),itemid);
        try {
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement1 = connection.prepareStatement(UPDATE_USERHISTORYVISIT);

            int num = history.getVisittimes() + 1;
            preparedStatement1.setInt(1, num);//visit
            preparedStatement1.setString(2, account.getUsername());//id
            preparedStatement1.setString(3, itemid);//cate

            int rows = preparedStatement1.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement1);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public boolean ifSameCategory(Account account, String categoryName) {
        return false;
    }

    @Override
    public void InitVisitNum(Account account, String itemName) {
        try{
            Connection connection=DBUtil.getConnection();

            PreparedStatement preparedStatement1=connection.prepareStatement(INIT_USERHISTORYNUM);
            preparedStatement1.setInt(1,0);
            preparedStatement1.setString(2, account.getUsername());
            preparedStatement1.setString(3, itemName);

            int rows=preparedStatement1.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement1);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public History getHistoryByUsername(String username, String category) {
        History accountResult = new History();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_HISTORYITEMNUM);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, category);

            ResultSet resultSet = preparedStatement.executeQuery();
            this.resultSetToHistory(accountResult,resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountResult;
    }

    @Override
    public void initCartVisitNum(Account account, String itemid) {
        try{
            Connection connection=DBUtil.getConnection();

            PreparedStatement preparedStatement1=connection.prepareStatement(INIT_USERHISTORYCART);
            preparedStatement1.setInt(1,0);
            preparedStatement1.setString(2, account.getUsername());
            preparedStatement1.setString(3, itemid);

            int rows=preparedStatement1.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement1);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public void UpdateCartVisitNum(Account account, String itemid) {
        History history=getHistoryByUsername(account.getUsername(),itemid);
        try {
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement1 = connection.prepareStatement(UPDATE_USERHISTORYCARTVISIT);

            int num = history.getAddtocarttimes() + 1;
            preparedStatement1.setInt(1, num);//visit
            preparedStatement1.setString(2, account.getUsername());//id
            preparedStatement1.setString(3, itemid);//cate

            int rows = preparedStatement1.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement1);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public void insertShoppingcart(Account account, CartItem cartItem, Item item, Product product, String address) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_SHOPPINGCART2);

            String username=account.getUsername();
            String itemid=item.getItemId();
            String productid=product.getProductId();
            String description=item.getAttribute1()+" "+product.getName();
            boolean instock = cartItem.isInStock();
            String inStock="";
            if(instock){
                inStock="true";
            }
            int quantity = cartItem.getQuantity();
            String ListPrice=item.getListPrice().toString();
            String total = String.valueOf(cartItem.getTotal());

            preparedStatement.setString(1,username);
            preparedStatement.setString(2,itemid);
            preparedStatement.setString(3,productid);
            preparedStatement.setString(4,description);
            preparedStatement.setString(5,inStock);
            preparedStatement.setInt(6,quantity);
            preparedStatement.setString(7,ListPrice);
            preparedStatement.setString(8,total);
            preparedStatement.setString(9,address);
            int times=0;
            preparedStatement.setInt(10,times);

            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void insertShoppingcart(Account account, CartItem cartItem, Item item, Product product) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_SHOPPINGCART);

            String username=account.getUsername();
            String itemid=item.getItemId();
            String productid=product.getProductId();
            String description=item.getAttribute1()+" "+product.getName();
            boolean instock = cartItem.isInStock();
            String inStock="";
            if(instock){
                inStock="true";
            }
            int quantity = cartItem.getQuantity();
            String ListPrice=item.getListPrice().toString();
            String total = String.valueOf(cartItem.getTotal());

            preparedStatement.setString(1,username);
            preparedStatement.setString(2,itemid);
            preparedStatement.setString(3,productid);
            preparedStatement.setString(4,description);
            preparedStatement.setString(5,inStock);
            preparedStatement.setInt(6,quantity);
            preparedStatement.setString(7,ListPrice);
            preparedStatement.setString(8,total);
            preparedStatement.setString(9,null);
            int times=1;
            preparedStatement.setInt(10,times);

            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteShoppingcartByUsernameAndItemid(Account account, CartItem cartItem) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(DELETE_SHOPPINGCART_BY_USERNAME_AND_ITEMID);
            Item item=cartItem.getItem();
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,item.getItemId());
            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteShoppingcartByUsername(Account account) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(DELETE_SHOPPINGCART_BY_USERNAME);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public boolean selectShoppingcartByUsernameAndItemId(Account account, CartItem cartItem) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_SHOPPINGCART_BY_USERNAME_AND_ITEMID);
            String username=account.getUsername();
            Item item = cartItem.getItem();
            String itemid=item.getItemId();
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,itemid);
            ResultSet resultSet=preparedStatement.executeQuery();

            if(resultSet.next()) {
                return true;
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean selectShoppingcartByUsername(Account account) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_SHOPPINGCART_BY_USERNAME);
            preparedStatement.setString(1,account.getUsername());

            int times=1;
            preparedStatement.setInt(2,times);

            ResultSet resultSet=preparedStatement.executeQuery();

            if(resultSet.next()) {
                return true;
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void selectShoppingcart(Account account, List<CartItem> cartItemList, List<Item> itemList, List<Product> productList) {
        try{
            if(selectShoppingcartByUsername(account)){
                Connection connection=DBUtil.getConnection();
                PreparedStatement preparedStatement=connection.prepareStatement(SELECT_SHOPPINGCART_BY_USERNAME);
                preparedStatement.setString(1,account.getUsername());
                int times=1;
                preparedStatement.setInt(2,times);

                ResultSet resultSet=preparedStatement.executeQuery();

                ItemDao itemDao=new ItemDaoImpl();
                ProductDao productDao = new ProductDaoImpl();

                String subTotal="";
                while(resultSet.next()) {
                    CartItem cartItem=new CartItem();
                    Item item=itemDao.getItem(resultSet.getString("itemid"));

                    item.setItemId(resultSet.getString("itemid"));
                    item.setProductId(resultSet.getString("productId"));

                    Product product=productDao.getProduct(item.getProductId());
                    product.setProductId(resultSet.getString("productId"));

                    item.setListPrice(resultSet.getBigDecimal("listprice"));

                    item.setProduct(product);
                    itemList.add(item);
                    productList.add(product);

                    cartItem.setItem(item);
                    cartItem.setQuantity(resultSet.getInt("quantity"));
                    cartItem.setTotal(resultSet.getBigDecimal("totalcost"));
                    cartItem.setInStock(resultSet.getBoolean("inStock"));

                    subTotal+=String.valueOf(cartItem.getTotal());
                    cartItemList.add(cartItem);
                }

                DBUtil.closePreparedStatement(preparedStatement);
                DBUtil.closeConnection(connection);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public boolean selectShoppingcartByUsernameAndTimes(Account account) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_SHOPPINGCART_BY_USERNAME_AND_TIMES);
            preparedStatement.setString(1,account.getUsername());
            ResultSet resultSet=preparedStatement.executeQuery();

            if(resultSet.next()) {
                return true;
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateShoppingcartByUsernameAndItemid(Account account, CartItem cartItem) {
        try{
            Connection connection=DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_SHOPPINGCART_BY_QUANTITY);

            String username=account.getUsername();
            Item item = cartItem.getItem();
            String itemid=item.getItemId();
            int quantity=cartItem.getQuantity();

            preparedStatement.setInt(1,quantity);
            preparedStatement.setString(2,username);
            preparedStatement.setString(3,itemid);


            int row=preparedStatement.executeUpdate();
            if(row > 0) {
                return true;
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateShoppingcartByAddress(Account account, CartItem cartItem, String add) {
        try{
            Connection connection=DBUtil.getConnection();

            String username=account.getUsername();
            Item item = cartItem.getItem();
            String itemid=item.getItemId();

            PreparedStatement preparedStatement1=connection.prepareStatement(UPDATE_SHOPPINGCART_BY_ADDRESS);
            preparedStatement1.setString(1,add);
            preparedStatement1.setString(2,username);
            preparedStatement1.setString(3,itemid);


            int row=preparedStatement1.executeUpdate();

            if(row > 0) {
                return true;
            }
            DBUtil.closePreparedStatement(preparedStatement1);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}