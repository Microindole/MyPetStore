package csu.web.mypetstore.web.servlet;

import csu.web.mypetstore.domain.Product;
import csu.web.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import com.alibaba.fastjson.JSON;

public class ProductAutoCompleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        CatalogService service = new CatalogService();
        List<Product> productList = service.searchProductList(keyword);

        String result = JSON.toJSONString(productList);
        System.out.println(result);

        resp.setContentType("text/json");
        PrintWriter out = resp.getWriter();
        out.println(result);

    }

}
