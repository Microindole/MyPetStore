package org.csu.petstore.controller;


import org.csu.petstore.annotation.LogAccount;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.csu.petstore.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/catalog")
public class CatalogController {

    @Autowired
    private CatalogService catalogService;

    @LogAccount
    @GetMapping("index")
    public String index(){
        return "catalog/main";
    }

    @LogAccount
    @GetMapping("categories/{id}")
    public CommonResponse<CategoryVO> viewCategory(@PathVariable("id") String categoryId){
        return catalogService.getCategory(categoryId);
    }


    @LogAccount
    @GetMapping("products/{id}")
    public CommonResponse<ProductVO> viewProduct(@PathVariable("id") String productId){
        return catalogService.getProduct(productId);
    }


    @LogAccount
    @GetMapping("items/{id}")
    public CommonResponse<ItemVO> viewItem(@PathVariable("id") String itemId){
        return catalogService.getItem(itemId);
    }


    @LogAccount
    @PostMapping("products/{keyword}")
    public CommonResponse<List<SearchVO>> searchProducts(@PathVariable("keyword") String keyword){
        return catalogService.getSearch(keyword);
    }

}

