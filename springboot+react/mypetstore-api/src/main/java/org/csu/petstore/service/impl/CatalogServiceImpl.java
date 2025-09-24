package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.common.CommonResponse;
import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.ItemMapper;
import org.csu.petstore.persistence.ItemQuantityMapper;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.persistence.CategoryMapper;
import org.csu.petstore.persistence.ProductMapper;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.csu.petstore.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("catalogService")
public class CatalogServiceImpl implements CatalogService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private ItemQuantityMapper itemQuantityMapper;

    @Override
    public CommonResponse<CategoryVO> getCategory(String categoryId) {
        CategoryVO categoryVO = new CategoryVO();
        Category category = categoryMapper.selectById(categoryId);

        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("category", categoryId);
        List<Product> productList = productMapper.selectList(queryWrapper);
        if (productList.isEmpty()) {
            return CommonResponse.createForError("该分类下没有商品");
        }else{
            categoryVO.setCategoryId(categoryId);
            categoryVO.setCategoryName(category.getName());
            categoryVO.setProductList(productList);
            return CommonResponse.createForSuccess(categoryVO);
        }


    }

    @Override
    public CommonResponse<ProductVO> getProduct(String productId) {
        ProductVO productVO = new ProductVO();
        Product product = productMapper.selectById(productId);

        QueryWrapper<Item> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("productid", productId);
        List<Item> itemList = itemMapper.selectList(queryWrapper);
        if(itemList.isEmpty()){
            return CommonResponse.createForError("该商品下没有商品项");
        }else{
            productVO.setProductId(productId);
            productVO.setCategoryId(product.getCategoryId());
            productVO.setProductName(product.getName());
            productVO.setItemList(itemList);
            return CommonResponse.createForSuccess(productVO);
        }
    }

    @Override
    public CommonResponse<ItemVO> getItem(String itemId) {
        ItemVO itemVO = new ItemVO();
        Item item = itemMapper.selectById(itemId);
        Product product = productMapper.selectById(item.getProductId());
        ItemQuantity itemQuantity = itemQuantityMapper.selectById(itemId);
        itemVO.setItemId(itemId);
        itemVO.setProductId(item.getProductId());
        itemVO.setProductName(product.getName());
        String [] temp = product.getDescription().split("\"");
        itemVO.setDescriptionImage(temp[1]);
        itemVO.setDescriptionText(temp[2].substring(1));
        itemVO.setListPrice(item.getListPrice());
        itemVO.setAttributes(item.getAttribute1());
        itemVO.setQuantity(itemQuantity.getQuantity());

        return CommonResponse.createForSuccess(itemVO);
    }

    @Override
    public CommonResponse<List<SearchVO>> getSearch(String keyword) {
        List<SearchVO> searchVOList = new ArrayList<>();

        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name", keyword);
        List<Product> productList = productMapper.selectList(queryWrapper);
        if (productList.isEmpty()) {
            return CommonResponse.createForError("没有找到相关商品");
        }else{
            for (Product product : productList) {
                SearchVO searchVO = new SearchVO();
                searchVO.setSearchName(product.getName());
                searchVO.setSearchId(product.getProductId());
                String [] temp = product.getDescription().split("\"");
                searchVO.setDescriptionImage(temp[1]);
                searchVO.setDescriptionText(temp[2].substring(1));
                searchVOList.add(searchVO);
            }
            return CommonResponse.createForSuccess(searchVOList);
        }

    }


}
