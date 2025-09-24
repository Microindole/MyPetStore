package org.csu.petstore.service;

import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.csu.petstore.vo.SearchVO;

import java.util.List;

public interface CatalogService {

    CategoryVO getCategory(String categoryId);

    ProductVO getProduct(String productId);

    ItemVO getItem(String itemId);

    List<SearchVO> getSearch(String keyword);
}

