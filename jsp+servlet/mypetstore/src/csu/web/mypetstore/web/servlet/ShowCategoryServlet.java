package csu.web.mypetstore.web.servlet;

import com.alibaba.fastjson.JSON;
import csu.web.mypetstore.domain.Product;
import csu.web.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class ShowCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        System.out.println(categoryId);
        List<Product> productList = new CatalogService().getProductListByCategory(categoryId);
        String resultCategory = JSON.toJSONString(productList);
        System.out.println(resultCategory);
        resp.setContentType("text/json");
//        resp.setHeader("Access-Control-Allow-Origin", "http://localhost:5500");
        PrintWriter out = resp.getWriter();
        out.println(resultCategory);
    }
}
