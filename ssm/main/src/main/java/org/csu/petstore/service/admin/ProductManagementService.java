package org.csu.petstore.service.admin;

import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.entity.Product;
import org.csu.petstore.vo.admin.AdminCategoryVO;
import org.csu.petstore.vo.admin.AdminItemVO;
import org.csu.petstore.vo.admin.AdminProductVO;

import java.util.List;

public interface ProductManagementService {
    // Category operations
    List<Category> getAllCategories();
    Category getCategoryById(String id);
    void saveCategory(Category category);
    void deleteCategory(String id);

    // Product operations
    List<Product> getAllProducts();
    List<AdminProductVO> getAllProductsWithCategory();
    Product getProductById(String id);
    void saveProduct(Product product);
    void deleteProduct(String id);

    // Item operations
    List<AdminItemVO> getAllItemsWithDetails();
    Item getItemById(String id);
    ItemQuantity getInventoryByItemId(String itemId);
    void saveItemWithInventory(Item item, Integer quantity);
    void updateInventory(String itemId, Integer quantity);
    void deleteItem(String id);
}