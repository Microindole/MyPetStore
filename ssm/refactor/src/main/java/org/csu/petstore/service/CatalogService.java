package org.csu.petstore.service;

import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.csu.petstore.vo.SearchVO;

import java.util.List;

public interface CatalogService {

    public CategoryVO getCategory(String categoryId);

    public ProductVO getProduct(String productId);

    public ItemVO getItem(String itemId);

//    public List<CategoryVO> getCategories();
    public List<SearchVO> getSearch(String keyword);
}

