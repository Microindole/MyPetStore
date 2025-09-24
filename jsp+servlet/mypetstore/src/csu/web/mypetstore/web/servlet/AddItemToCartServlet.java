package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.CartItem;
import csu.web.mypetstore.domain.Item;
import csu.web.mypetstore.service.CartService;
import csu.web.mypetstore.service.CatalogService;
import csu.web.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddItemToCartServlet extends HttpServlet {

    private static final String CART_FORM = "/WEB-INF/jsp/cart/cart.jsp";
    public static final String SIGNON_FORM = "/WEB-INF/jsp/account/signon.jsp";
    private String workingItemId;
    private Cart cart;
    private CartItem cartItem;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =req.getSession();
        Account account= (Account) session.getAttribute("loginAccount");
        if (account==null){
            req.getRequestDispatcher(SIGNON_FORM).forward(req,resp);
        }
        else{
            workingItemId = req.getParameter("workingItemId");
            cart= (Cart) session.getAttribute("cart");
            CartService cartService=new CartService();
            if (cart==null){
                cart = new Cart();
            }
            if (cart.containsItemId(workingItemId)){
                cartItem=new CartItem();
                cartItem=cart.incrementQuantityByItemId(workingItemId);
                cartService.updateCart(account,cartItem);

                if(account != null){
                    HttpServletRequest httpRequest= req;
                    String strBackUrl = "http://" + req.getServerName() + ":" + req.getServerPort()
                            + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                    LogService logService = new LogService();
                    String logInfo = logService.logInfo(" ") + strBackUrl + " 新增购物车商品 " + workingItemId;
                    logService.insertLogInfo(account.getUsername(), logInfo);
                }
            }

            else{
                CatalogService catalogService = new CatalogService();
                boolean isInstock = catalogService.isItemInStock(workingItemId);
                Item item = catalogService.getItem(workingItemId);
                cartItem =new CartItem();
                cartItem.setItem(item);
                cartItem.setQuantity(1);

                if(account != null){
                    HttpServletRequest httpRequest= req;
                    String strBackUrl = "http://" + req.getServerName() + ":" + req.getServerPort()
                            + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

                    LogService logService = new LogService();
                    String logInfo = logService.logInfo(" ") + strBackUrl + " 增加商品 " + workingItemId;
                    logService.insertLogInfo(account.getUsername(), logInfo);
                }

                cartService.insertCart(account,cartItem);
                cart.addItem(item,isInstock);
            }
            session.setAttribute("cart",cart);
            req.getRequestDispatcher(CART_FORM).forward(req,resp);
        }

    }
}
