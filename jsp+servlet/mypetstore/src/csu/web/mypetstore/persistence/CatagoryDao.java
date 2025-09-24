package csu.web.mypetstore.persistence;

import csu.web.mypetstore.domain.Category;

import java.util.List;

public interface CatagoryDao {
    List<Category> getCategoryList();

    Category getCategory(String categoryId);

}
