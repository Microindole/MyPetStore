package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.CartItem;
import csu.web.mypetstore.domain.Item;
import csu.web.mypetstore.persistence.CartDao;
import csu.web.mypetstore.persistence.impl.CartDaoImpl;
import csu.web.mypetstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AjaxUpdateCartServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CartService cartService;
        HttpSession session = req.getSession();

        Account account = (Account) session.getAttribute("loginAccount");
        if (account != null) {
            cartService = new CartService();
            CartDao cartDao = new CartDaoImpl();
            Cart cart = (Cart) session.getAttribute("cart");

//            向cartItem传值，并更新购物车
            Item item = new Item();
            CartItem cartItem = new CartItem();
            cartItem.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            cartItem.setItemId(req.getParameter("itemId"));
            item.setItemId(req.getParameter("itemId"));
            item.setQuantity(Integer.parseInt(req.getParameter("quantity")));

            cartDao.updateCart(account.getUsername(),cartItem.getItemId(),item.getQuantity());

//            更新session域的内容
            session.setAttribute("cart",cartService.getCartByAccount(account));
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
