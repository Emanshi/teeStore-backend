package com.teestore.backend.dao;

import com.teestore.backend.enums.Category;
import com.teestore.backend.model.Product;

import java.util.List;

public interface ProductDAO {

    Product getProductById(String productId) throws Exception;
    List<Product> getProductsByCategory(Category category) throws Exception;
    List<Product> getProductByGroup(String productGroup) throws Exception;
    List<Product> getProductCategoryByPrice(Category category,Boolean reverse) throws Exception;
    List<Product> getAllProducts() throws Exception;
    List<Product> getNewArrivals() throws Exception;
    List<Product> getProductByDiscount(Category category) throws Exception;

}
