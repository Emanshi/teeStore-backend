package com.teestore.backend.service;

import com.teestore.backend.dao.ProductDAO;
import com.teestore.backend.enums.Category;
import com.teestore.backend.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service(value="productService")
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    public Product getProductById(String productId) throws Exception {

        if(productId==null)
            throw new Exception("ProductService.INVALID_PRODUCT_ID");

        Product product= productDAO.getProductById(productId);

        if(product== null)
            throw new Exception("ProductService.PRODUCT_NOT_FOUND");

        return product;
    }

    @Override
    public List<Product> getProductsByCategory(Category category) throws Exception {

        if(category== null)
            throw new Exception("ProductService.INVALID_PRODUCT_CATEGORY");

        List<Product> productList= productDAO.getProductsByCategory(category);

        if(productList== null || productList.isEmpty())
            throw new Exception("ProductService.PRODUCT_LIST_NOT_FOUND");

        return productList;
    }

    @Override
    public List<Product> getProductByGroup(String productGroup) throws Exception {

        if(productGroup ==null)
            throw new Exception("ProductService.INVALID_PRODUCT_GROUP");

        List<Product> productList= productDAO.getProductByGroup(productGroup);

        if(productList== null || productList.isEmpty())
            throw new Exception("ProductService.PRODUCT_LIST_NOT_FOUND");

        return productList;
    }

    @Override
    public List<Product> getProductCategoryByPrice(Category category, Boolean reverse) throws Exception {

        if(category ==null || reverse==null)
            throw new Exception("ProductService.INVALID_PRODUCT_CATEGORY");

        List<Product> productList= productDAO.getProductCategoryByPrice(category, reverse);

        if(productList == null || productList.isEmpty())
            throw new Exception("ProductService.PRODUCT_LIST_NOT_FOUND");

        return productList;
    }

    @Override
    public List<Product> getAllProducts() throws Exception {

        List<Product> productList= productDAO.getAllProducts();

        if(productList == null || productList.isEmpty())
            throw new Exception("ProductService.PRODUCT_LIST_NOT_FOUND");

        return productList;
    }

    @Override
    public List<Product> getNewArrivals() throws Exception {

        List<Product> productList= productDAO.getNewArrivals();

        if(productList == null || productList.isEmpty())
            throw new Exception("ProductService.PRODUCT_LIST_NOT_FOUND");

        return productList;
    }

    @Override
    public List<Product> getProductByDiscount(Category category) throws Exception {

        if(category ==null)
            throw new Exception("ProductService.INVALID_PRODUCT_CATEGORY");

        List<Product> productList= productDAO.getProductByDiscount(category);

        if(productList == null || productList.isEmpty())
            throw new Exception("ProductService.PRODUCT_LIST_NOT_FOUND");

        return productList;
    }

    @Override
    public List<Product> getProductBySearch(String search) throws Exception {

        if(search ==null)
            throw new Exception("ProductService.INVALID_PRODUCT_SEARCH");

        List<Product> productList= productDAO.getProductBySearchQuery(search);

        if(productList == null || productList.isEmpty())
            throw new Exception("ProductService.PRODUCT_LIST_NOT_FOUND");

        return productList;
    }
}
