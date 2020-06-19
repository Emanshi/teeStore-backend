package com.teestore.backend.service;

import com.teestore.backend.enums.Category;
import com.teestore.backend.model.Product;

import java.util.List;

public interface ProductService {

    Product getProductById(String productId) throws Exception;
    List<Product> getProductsByCategory(Category category) throws Exception;
    List<Product> getAllProducts() throws Exception;
    List<Product> getNewArrivals() throws Exception;
    List<Product> getProductByDiscount(Category category) throws Exception;
    List<Product> getProductBySearch(String search) throws Exception;
}
