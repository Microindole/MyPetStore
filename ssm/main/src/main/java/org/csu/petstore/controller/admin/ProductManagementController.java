package org.csu.petstore.controller.admin;

import jakarta.servlet.http.HttpSession;
import org.csu.petstore.annotation.LogAdmin;
import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.ItemQuantity;
import org.csu.petstore.entity.Product;
import org.csu.petstore.service.admin.ProductManagementService;
import org.csu.petstore.vo.AdminVO;
import org.csu.petstore.vo.admin.AdminItemVO;
import org.csu.petstore.vo.admin.AdminProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.logging.Logger;

@Controller
@RequestMapping("/admin/products")
@SessionAttributes("admin")
public class ProductManagementController {

    private static final Logger logger = Logger.getLogger(ProductManagementController.class.getName());

    @Autowired
    private ProductManagementService productManagementService;

    @Autowired
    private HttpSession session;


    @LogAdmin
    @GetMapping("/categories")
    public String listCategories(@SessionAttribute("admin") AdminVO adminVO, Model model) {
        model.addAttribute("admin", adminVO);
        List<Category> categories = productManagementService.getAllCategories();
        model.addAttribute("categories", categories);
        return "admin/category/list";
    }

    @LogAdmin
    @GetMapping("/categories/new")
    public String newCategoryForm(@SessionAttribute("admin") AdminVO adminVO, Model model) {
        model.addAttribute("admin", adminVO);
        model.addAttribute("category", new Category());
        return "admin/category/form";
    }

    @LogAdmin
    @PostMapping("/categories")
    public String saveCategory(@SessionAttribute("admin") AdminVO adminVO,
                               @ModelAttribute Category category,
                               Model model) {
        model.addAttribute("admin", adminVO);
        productManagementService.saveCategory(category);
        return "redirect:/admin/products/categories";
    }

    @LogAdmin
    @GetMapping("/categories/edit/{id}")
    public String editCategoryForm(@SessionAttribute("admin") AdminVO adminVO,
                                   @PathVariable String id,
                                   Model model) {
        model.addAttribute("admin", adminVO);
        Category category = productManagementService.getCategoryById(id);
        model.addAttribute("category", category);
        return "admin/category/form";
    }

    @LogAdmin
    @GetMapping("/categories/delete/{id}")
    public String deleteCategory(@SessionAttribute("admin") AdminVO adminVO,
                                 @PathVariable String id,
                                 Model model) {
        model.addAttribute("admin", adminVO);
        productManagementService.deleteCategory(id);
        return "redirect:/admin/products/categories";
    }



    @LogAdmin
    @GetMapping("/products")
    public String listProducts(@SessionAttribute("admin") AdminVO adminVO, Model model) {
        model.addAttribute("admin", adminVO);
        List<AdminProductVO> products = productManagementService.getAllProductsWithCategory();
        model.addAttribute("products", products);
        return "admin/product/list";
    }

    @LogAdmin
    @GetMapping("/products/new")
    public String newProductForm(@SessionAttribute("admin") AdminVO adminVO, Model model) {
        model.addAttribute("admin", adminVO);
        model.addAttribute("product", new Product());
        List<Category> categories = productManagementService.getAllCategories();
        model.addAttribute("categories", categories);
        return "admin/product/form";
    }

    @LogAdmin
    @PostMapping("/products")
    public String saveProduct(@SessionAttribute("admin") AdminVO adminVO,
                              @ModelAttribute Product product,
                              @RequestParam("productImage") MultipartFile productImage,
                              @RequestParam("descriptionText") String descriptionText,
                              Model model) throws IOException {
        model.addAttribute("admin", adminVO);

        String description = "";
        if (productImage != null && !productImage.isEmpty()) {
            String filename = productImage.getOriginalFilename();
            String imagePath = "/images/products/" + filename;

            String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/images/products/";

            File directory = new File(uploadDir);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            Path filePath = Paths.get(uploadDir + filename);
            Files.copy(productImage.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            description = "<image src=\"" + imagePath + "\">" + descriptionText;
        } else {
            description = descriptionText;
        }

        product.setDescription(description);
        productManagementService.saveProduct(product);
        return "redirect:/admin/products/products";
    }
    @LogAdmin
    @GetMapping("/products/edit/{id}")
    public String editProductForm(@SessionAttribute("admin") AdminVO adminVO,
                                  @PathVariable String id,
                                  Model model) {
        model.addAttribute("admin", adminVO);
        Product product = productManagementService.getProductById(id);
        List<Category> categories = productManagementService.getAllCategories();
        model.addAttribute("product", product);
        model.addAttribute("categories", categories);

        if (product.getDescription() != null && product.getDescription().contains("\"")) {
            String[] parts = product.getDescription().split("\"");
            if (parts.length > 1) {
                model.addAttribute("imageUrl", parts[1]);
                if (parts.length > 2) {
                    model.addAttribute("descriptionText", parts[2].substring(1));
                }
            }
        }

        return "admin/product/form";
    }

    @LogAdmin
    @GetMapping("/products/delete/{id}")
    public String deleteProduct(@SessionAttribute("admin") AdminVO adminVO,
                                @PathVariable String id,
                                Model model) {
        model.addAttribute("admin", adminVO);
        productManagementService.deleteProduct(id);
        return "redirect:/admin/products/products";
    }


    @LogAdmin
    @GetMapping("/items")
    public String listItems(@SessionAttribute("admin") AdminVO adminVO, Model model) {
        model.addAttribute("admin", adminVO);
        List<AdminItemVO> items = productManagementService.getAllItemsWithDetails();
        model.addAttribute("items", items);
        return "admin/item/list";
    }

    @LogAdmin
    @GetMapping("/items/new")
    public String newItemForm(@SessionAttribute("admin") AdminVO adminVO, Model model) {
        model.addAttribute("admin", adminVO);
        model.addAttribute("item", new Item());
        model.addAttribute("inventory", new ItemQuantity());
        List<Product> products = productManagementService.getAllProducts();
        model.addAttribute("products", products);
        model.addAttribute("formAction", "/admin/products/items");
        model.addAttribute("isEdit", false);
        return "admin/item/form";
    }

    @LogAdmin
    @GetMapping("/items/edit/{id}")
    public String editItemForm(@SessionAttribute("admin") AdminVO adminVO,
                               @PathVariable String id,
                               Model model) {
        try {
            model.addAttribute("admin", adminVO);
            Item item = productManagementService.getItemById(id);

            if (item == null) {
                return "redirect:/admin/products/items";
            }

            ItemQuantity inventory = productManagementService.getInventoryByItemId(id);
            List<Product> products = productManagementService.getAllProducts();

            logger.info("Editing item: " + item.toString());

            model.addAttribute("item", item);
            model.addAttribute("inventory", inventory != null ? inventory : new ItemQuantity());
            model.addAttribute("products", products);
            model.addAttribute("formAction", "/admin/products/items");
            model.addAttribute("isEdit", true);
            return "admin/item/form";
        } catch (Exception e) {
            logger.severe("Error loading item for edit: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/admin/products/items";
        }
    }

    @LogAdmin
    @RequestMapping(value = "/items", method = RequestMethod.POST)
    public String saveItem(@SessionAttribute("admin") AdminVO adminVO,
                           @ModelAttribute Item item,
                           @RequestParam("quantity") Integer quantity,
                           RedirectAttributes redirectAttributes,
                           Model model) {
        model.addAttribute("admin", adminVO);

        try {
            logger.info("Saving item: " + item.toString());

            if (item.getProductId() == null || item.getProductId().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Product ID is required");
                return "redirect:/admin/products/items";
            }

            if (item.getStatus() == null) {
                item.setStatus("P"); // Set a default status
            }
            
            productManagementService.saveItemWithInventory(item, quantity);
            redirectAttributes.addFlashAttribute("success", "Item saved successfully");
        } catch (Exception e) {
            logger.severe("Error saving item: " + e.getMessage());
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Error saving item: " + e.getMessage());
        }

        return "redirect:/admin/products/items";
    }

    @LogAdmin
    @GetMapping("/items/delete/{id}")
    public String deleteItem(@SessionAttribute("admin") AdminVO adminVO,
                             @PathVariable String id,
                             RedirectAttributes redirectAttributes,
                             Model model) {
        model.addAttribute("admin", adminVO);
        try {
            productManagementService.deleteItem(id);
            redirectAttributes.addFlashAttribute("success", "Item deleted successfully");
        } catch (Exception e) {
            logger.severe("Error deleting item: " + e.getMessage());
            redirectAttributes.addFlashAttribute("error", "Error deleting item: " + e.getMessage());
        }
        return "redirect:/admin/products/items";
    }

    @LogAdmin
    @PostMapping("/items/inventory")
    public String updateInventory(@SessionAttribute("admin") AdminVO adminVO,
                                  @RequestParam("itemId") String itemId,
                                  @RequestParam("quantity") Integer quantity,
                                  RedirectAttributes redirectAttributes,
                                  Model model) {
        model.addAttribute("admin", adminVO);
        try {
            productManagementService.updateInventory(itemId, quantity);
            redirectAttributes.addFlashAttribute("success", "Inventory updated successfully");
        } catch (Exception e) {
            logger.severe("Error updating inventory: " + e.getMessage());
            redirectAttributes.addFlashAttribute("error", "Error updating inventory: " + e.getMessage());
        }
        return "redirect:/admin/products/items";
    }
}