package org.csu.petstore.service.admin.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.CategoryMapper;
import org.csu.petstore.persistence.ItemMapper;
import org.csu.petstore.persistence.ItemQuantityMapper;
import org.csu.petstore.persistence.ProductMapper;
import org.csu.petstore.service.admin.ProductManagementService;
import org.csu.petstore.vo.admin.AdminItemVO;
import org.csu.petstore.vo.admin.AdminProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service("productManagementService")
public class ProductManagementServiceImpl implements ProductManagementService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ItemMapper itemMapper;

    @Autowired
    private ItemQuantityMapper itemQuantityMapper;

    // ==== Category Management ====

    @Override
    public List<Category> getAllCategories() {
        return categoryMapper.selectList(null);
    }

    @Override
    public Category getCategoryById(String id) {
        return categoryMapper.selectById(id);
    }

    @Override
    @Transactional
    public void saveCategory(Category category) {
        // Generate ID for new categories if empty
        if (category.getCategoryId() == null || category.getCategoryId().isEmpty()) {
            category.setCategoryId(generateCategoryId());
        }

        // Check if category exists
        Category existing = categoryMapper.selectById(category.getCategoryId());
        if (existing != null) {
            // Update
            categoryMapper.updateById(category);
        } else {
            // Insert
            categoryMapper.insert(category);
        }
    }

    @Override
    @Transactional
    public void deleteCategory(String id) {
        // First, delete all associated products
        QueryWrapper<Product> productQuery = new QueryWrapper<>();
        productQuery.eq("category", id);
        List<Product> products = productMapper.selectList(productQuery);

        for (Product product : products) {
            deleteProduct(product.getProductId());
        }

        // Then delete the category
        categoryMapper.deleteById(id);
    }

    // ==== Product Management ====

    @Override
    public List<Product> getAllProducts() {
        return productMapper.selectList(null);
    }

    @Override
    public List<AdminProductVO> getAllProductsWithCategory() {
        List<Product> products = productMapper.selectList(null);
        List<AdminProductVO> productVOs = new ArrayList<>();

        for (Product product : products) {
            AdminProductVO vo = new AdminProductVO();
            vo.setProduct(product);

            // Get category
            Category category = categoryMapper.selectById(product.getCategoryId());
            vo.setCategory(category);

            // Count items
            QueryWrapper<Item> itemQuery = new QueryWrapper<>();
            itemQuery.eq("productid", product.getProductId());
            Long itemCount = itemMapper.selectCount(itemQuery);
            vo.setItemCount(itemCount);

            productVOs.add(vo);
        }

        return productVOs;
    }

    @Override
    public Product getProductById(String id) {
        return productMapper.selectById(id);
    }

    @Override
    @Transactional
    public void saveProduct(Product product) {
        // Generate ID for new products if empty
        if (product.getProductId() == null || product.getProductId().isEmpty()) {
            product.setProductId(generateProductId(product.getCategoryId()));
        }

        // Check if product exists
        Product existing = productMapper.selectById(product.getProductId());
        if (existing != null) {
            // Update
            productMapper.updateById(product);
        } else {
            // Insert
            productMapper.insert(product);
        }
    }

    @Override
    @Transactional
    public void deleteProduct(String id) {
        // First, delete all associated items
        QueryWrapper<Item> itemQuery = new QueryWrapper<>();
        itemQuery.eq("productid", id);
        List<Item> items = itemMapper.selectList(itemQuery);

        for (Item item : items) {
            deleteItem(item.getItemId());
        }

        // Then delete the product
        productMapper.deleteById(id);
    }

    // ==== Item Management ====

    @Override
    public List<AdminItemVO> getAllItemsWithDetails() {
        List<Item> items = itemMapper.selectList(null);
        List<AdminItemVO> itemVOs = new ArrayList<>();

        for (Item item : items) {
            AdminItemVO vo = new AdminItemVO();
            vo.setItem(item);

            // Get product
            Product product = productMapper.selectById(item.getProductId());
            vo.setProduct(product);

            // Get category
            if (product != null) {
                Category category = categoryMapper.selectById(product.getCategoryId());
                vo.setCategory(category);
            }

            // Get inventory
            ItemQuantity inventory = itemQuantityMapper.selectById(item.getItemId());
            if (inventory != null) {
                vo.setQuantity(inventory.getQuantity());
            } else {
                vo.setQuantity(0);
            }

            itemVOs.add(vo);
        }

        return itemVOs;
    }

    @Override
    public Item getItemById(String id) {
        return itemMapper.selectById(id);
    }

    @Override
    public ItemQuantity getInventoryByItemId(String itemId) {
        return itemQuantityMapper.selectById(itemId);
    }

    @Override
    @Transactional
    public void saveItemWithInventory(Item item, Integer quantity) {
        // Generate ID for new items if empty
        if (item.getItemId() == null || item.getItemId().isEmpty()) {
            item.setItemId(generateItemId(item.getProductId()));
        }

        // Check if item exists
        Item existing = itemMapper.selectById(item.getItemId());
        if (existing != null) {
            // Update
            itemMapper.updateById(item);
        } else {
            // Insert
            itemMapper.insert(item);
        }

        // Update inventory
        updateInventory(item.getItemId(), quantity);
    }

    @Override
    @Transactional
    public void updateInventory(String itemId, Integer quantity) {
        ItemQuantity inventory = itemQuantityMapper.selectById(itemId);

        if (inventory != null) {
            // Update
            inventory.setQuantity(quantity);
            itemQuantityMapper.updateById(inventory);
        } else {
            // Insert
            inventory = new ItemQuantity();
            inventory.setItemId(itemId);
            inventory.setQuantity(quantity);
            itemQuantityMapper.insert(inventory);
        }
    }

    @Override
    @Transactional
    public void deleteItem(String id) {
        // Delete inventory first
        itemQuantityMapper.deleteById(id);

        // Delete item
        itemMapper.deleteById(id);
    }

    // Helper methods for ID generation

    private String generateCategoryId() {
        // Simple ID generation - in production, use a more robust method
        return "CAT" + UUID.randomUUID().toString().substring(0, 5).toUpperCase();
    }

    private String generateProductId(String categoryId) {
        return categoryId + "-" + UUID.randomUUID().toString().substring(0, 5).toUpperCase();
    }

    private String generateItemId(String productId) {
        return productId + "-" + UUID.randomUUID().toString().substring(0, 5).toUpperCase();
    }
}