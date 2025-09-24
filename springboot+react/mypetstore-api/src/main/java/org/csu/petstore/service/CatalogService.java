package org.csu.petstore.service;

import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.csu.petstore.vo.SearchVO;

import java.util.List;

public interface CatalogService {

    CommonResponse<CategoryVO> getCategory(String categoryId);

    CommonResponse<ProductVO> getProduct(String productId);

    CommonResponse<ItemVO> getItem(String itemId);

    CommonResponse<List<SearchVO>> getSearch(String keyword);
}

