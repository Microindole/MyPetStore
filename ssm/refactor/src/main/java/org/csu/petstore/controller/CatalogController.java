package org.csu.petstore.controller;


import org.csu.petstore.annotation.Annotation;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.csu.petstore.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/catalog")
public class CatalogController {

    @Autowired
    private CatalogService catalogService;

    @Annotation

    @GetMapping("index")
    public String index(){
        return "catalog/main";
    }

    @Annotation
    @GetMapping("viewCategory")
    public String viewCategory(@RequestParam String categoryId, Model model){
        CategoryVO categoryVO = catalogService.getCategory(categoryId);
        model.addAttribute("category", categoryVO);
        return "catalog/category";
    }

    @Annotation
    @GetMapping("viewProduct")
    public String viewProduct(@RequestParam String productId, Model model){
        ProductVO productVO = catalogService.getProduct(productId);
        model.addAttribute("product", productVO);
        return "catalog/product";
    }

    @Annotation
    @GetMapping("viewItem")
    public String viewItem(@RequestParam String itemId, Model model){
        ItemVO itemVO = catalogService.getItem(itemId);
        model.addAttribute("item", itemVO);
        return "catalog/item";
    }

    @Annotation
    @PostMapping("searchProducts")
    public String searchProducts(@RequestParam String keyword, Model model){
        List<SearchVO> searchVOList = catalogService.getSearch(keyword);
        model.addAttribute("searchList", searchVOList);
        return "catalog/searchProducts";
    }
}
