package csu.web.mypetstore.persistence;

import csu.web.mypetstore.domain.*;

import java.util.List;

public interface AccountDao {
    Account getAccountByUsername(String username);

    Account getAccountByUsernameAndPassword(Account account);

   boolean insertAccount(Account account);

    void insertProfile(Account account);

    void insertSignon(Account account);

    void updateAccount(Account account);

    void updateProfile(Account account);

    void updateSignon(Account account);

    boolean selectAccountByUsername(String username);

    void insertHistroyUser(Account account,String id);

    public void insertHistroyUserId(Account account,String itemName);

    boolean findHistoryByUsernameandCategory(String username, String categoryName);

    public void UpdateVisitNum(Account account,String itemid);//更新数字

    public boolean ifSameCategory(Account account,String categoryName);

    public void InitVisitNum(Account account,String itemName);

    History getHistoryByUsername(String username, String category);

    void initCartVisitNum(Account account,String itemid);

    public void UpdateCartVisitNum(Account account,String itemid);//更新数字
    //购物车的数据库管理
    void insertShoppingcart(Account account, CartItem cartItem, Item item, Product product, String address);

    void insertShoppingcart(Account account, CartItem cartItem, Item item, Product product);

    void deleteShoppingcartByUsernameAndItemid(Account account,CartItem cartItem);

    void deleteShoppingcartByUsername(Account account);

    boolean selectShoppingcartByUsernameAndItemId(Account account,CartItem cartItem);

    boolean selectShoppingcartByUsername(Account account);

    void selectShoppingcart(Account account, List<CartItem> cartItemList, List<Item> itemList, List<Product> productList);

    boolean selectShoppingcartByUsernameAndTimes(Account account);

    boolean updateShoppingcartByUsernameAndItemid(Account account,CartItem cartItem);

    boolean updateShoppingcartByAddress(Account account,CartItem cartItem,String add);

    boolean selectAccountByPassword(String password);

}
