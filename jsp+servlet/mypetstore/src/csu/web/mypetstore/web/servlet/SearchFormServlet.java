package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Account;
import csu.web.mypetstore.domain.Item;
import csu.web.mypetstore.domain.Product;
import csu.web.mypetstore.service.CatalogService;
import csu.web.mypetstore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SearchFormServlet extends HttpServlet {

    private CatalogService catalogService;

    private static final String SEARCH_FORM = "/WEB-INF/jsp/catalog/searchProducts.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword;
        keyword = req.getParameter("keyword");
        CatalogService service = new CatalogService();
        List<Product> productList = service.searchProductList(keyword);
        HttpSession session = req.getSession();
        session.setAttribute("productList",productList);
        Account account = (Account)session.getAttribute("loginAccount");

        if(account != null){
            HttpServletRequest httpRequest= req;
            String strBackUrl = "http://" + req.getServerName() + ":" + req.getServerPort()
                    + httpRequest.getContextPath() + httpRequest.getServletPath() + "?" + (httpRequest.getQueryString());

            LogService logService = new LogService();
            String logInfo = logService.logInfo(" ") + strBackUrl + " 查找商品 " + keyword;
            logService.insertLogInfo(account.getUsername(), logInfo);
        }

        req.getRequestDispatcher(SEARCH_FORM).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
