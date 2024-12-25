package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Cart;
import csu.web.mypetstore.domain.CartItem;
import csu.web.mypetstore.persistence.CartDao;
import csu.web.mypetstore.persistence.impl.CartDaoImpl;
import csu.web.mypetstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AjaxRemoveCartServlet extends HttpServlet {

    private static final String ERROR = "/WEB-INF/jsp/common/error.jsp";
    private static final String CART = "/WEB-INF/jsp/cart/cart.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();


        String itemId = req.getParameter("itemId");
        Account account = (Account) session.getAttribute("loginAccount");
        Cart cart = (Cart)session.getAttribute("cart");

//        CartDao cartDao = new CartDaoImpl();
        CartItem cartItem = cart.removeCartItemById(itemId);

//            从数据库中删除cartItem
        CartService cartService = new CartService();
        CartDao cartDao = new CartDaoImpl();
        cartDao.deleteCart(account.getUsername(), itemId);
//        更新session域的内容
        session.setAttribute("cart", cartService.getCartByAccount(account));
//        req.getRequestDispatcher(CART).forward(req,resp);
//        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
