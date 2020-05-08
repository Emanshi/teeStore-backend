package com.teestore.backend.dao;

import com.teestore.backend.entity.ProductEntity;
import com.teestore.backend.enums.Category;
import com.teestore.backend.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Repository(value= "productDAO")
public class ProductDAOImpl implements ProductDAO{

    @Autowired
    private EntityManager entityManager;

    @Override
    public Product getProductById(String productId) throws Exception {

        ProductEntity productEntity =entityManager.find(ProductEntity.class, productId);

        if(productEntity== null)
            return null;

        Product product=new Product();
        product.setProductId(productEntity.getProductId());
        product.setProductName(productEntity.getProductName());
        product.setCategory(productEntity.getCategory());
        product.setCost(productEntity.getCost());
        product.setQuantity(productEntity.getQuantity());
        product.setDateOfAddition(productEntity.getDateOfAddition());
        product.setSex(productEntity.getSex());
        product.setSize(productEntity.getSize());
        product.setProductGroup(productEntity.getProductGroup());
        product.setProductInfo(productEntity.getProductInfo());
        product.setAvgRating(productEntity.getAvgRating());
        product.setDiscount(productEntity.getDiscount());

        return product;
    }

    @Override
    public List<Product> getProductsByCategory(Category category) throws Exception {

        Query query= entityManager.createQuery("select p from ProductEntity p where p.category :=category");
        query.setParameter("category",category);

        List<ProductEntity> productEntityList=query.getResultList();
        List<Product> productList=null;

        if(productEntityList!=null && !productEntityList.isEmpty()){

            productList=new ArrayList<>();
            for(ProductEntity productEntity:productEntityList){
                Product product=new Product();
                product.setProductId(productEntity.getProductId());
                product.setProductName(productEntity.getProductName());
                product.setCategory(productEntity.getCategory());
                product.setCost(productEntity.getCost());
                product.setQuantity(productEntity.getQuantity());
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());
                product.setSize(productEntity.getSize());
                product.setProductGroup(productEntity.getProductGroup());
                product.setProductInfo(productEntity.getProductInfo());
                product.setAvgRating(productEntity.getAvgRating());
                product.setDiscount(productEntity.getDiscount());

                productList.add(product);
            }

        }
        return productList;
    }

    @Override
    public List<Product> getProductByGroup(String productGroup) throws Exception {

        Query query= entityManager.createQuery("select p from ProductEntity p where p.productGroup:=productGroup");
        query.setParameter("productGroup",productGroup);

        List<ProductEntity> productEntityList= query.getResultList();
        List<Product> productList= null;

        if(productEntityList!=null && !productEntityList.isEmpty()){

            productList=new ArrayList<>();
            for(ProductEntity productEntity:productEntityList){
                Product product=new Product();
                product.setProductId(productEntity.getProductId());
                product.setProductName(productEntity.getProductName());
                product.setCategory(productEntity.getCategory());
                product.setCost(productEntity.getCost());
                product.setQuantity(productEntity.getQuantity());
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());
                product.setSize(productEntity.getSize());
                product.setProductGroup(productEntity.getProductGroup());
                product.setProductInfo(productEntity.getProductInfo());
                product.setAvgRating(productEntity.getAvgRating());
                product.setDiscount(productEntity.getDiscount());

                productList.add(product);
            }
        }
        return productList;
    }

    @Override
    public List<Product> getProductCategoryByPrice(Category category, Boolean reverse) throws Exception {

        Query query=null;
        if(reverse){
            query= entityManager.createQuery("select p from ProductEntity p where p.category :=category order by p.price desc");
            query.setParameter("category",category);
        }
        else{
            query= entityManager.createQuery("select p from ProductEntity p where p.category :=category order by p.price asc");
            query.setParameter("category",category);
        }

        List<ProductEntity> productEntityList= query.getResultList();
        List<Product> productList= null;

        if(productEntityList!=null && !productEntityList.isEmpty()){

            productList=new ArrayList<>();
            for(ProductEntity productEntity:productEntityList){
                Product product=new Product();
                product.setProductId(productEntity.getProductId());
                product.setProductName(productEntity.getProductName());
                product.setCategory(productEntity.getCategory());
                product.setCost(productEntity.getCost());
                product.setQuantity(productEntity.getQuantity());
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());
                product.setSize(productEntity.getSize());
                product.setProductGroup(productEntity.getProductGroup());
                product.setProductInfo(productEntity.getProductInfo());
                product.setAvgRating(productEntity.getAvgRating());
                product.setDiscount(productEntity.getDiscount());

                productList.add(product);
            }
        }
        return productList;
    }

    @Override
    public List<Product> getAllProducts() throws Exception {

        Query query= entityManager.createQuery("select p from ProductEntity p");

        List<ProductEntity> productEntityList= query.getResultList();
        List<Product> productList= null;

        if(productEntityList!=null && !productEntityList.isEmpty()){

            productList=new ArrayList<>();
            for(ProductEntity productEntity:productEntityList){
                Product product=new Product();
                product.setProductId(productEntity.getProductId());
                product.setProductName(productEntity.getProductName());
                product.setCategory(productEntity.getCategory());
                product.setCost(productEntity.getCost());
                product.setQuantity(productEntity.getQuantity());
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());
                product.setSize(productEntity.getSize());
                product.setProductGroup(productEntity.getProductGroup());
                product.setProductInfo(productEntity.getProductInfo());
                product.setAvgRating(productEntity.getAvgRating());
                product.setDiscount(productEntity.getDiscount());

                productList.add(product);
            }
        }
        return productList;
    }

    @Override
    public List<Product> getNewArrivals() throws Exception {

        LocalDateTime withinOneMonthDate= LocalDateTime.now().minusMonths(1);
        Query query= entityManager.createQuery("select p from ProductEntity p where p.dateOfAddition > :withinOneMonthDate");
        query.setParameter("withinOneMonthDate", withinOneMonthDate);

        List<ProductEntity> productEntityList= query.getResultList();
        List<Product> productList= null;

        if(productEntityList!=null && !productEntityList.isEmpty()){

            productList=new ArrayList<>();
            for(ProductEntity productEntity:productEntityList){
                Product product=new Product();
                product.setProductId(productEntity.getProductId());
                product.setProductName(productEntity.getProductName());
                product.setCategory(productEntity.getCategory());
                product.setCost(productEntity.getCost());
                product.setQuantity(productEntity.getQuantity());
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());
                product.setSize(productEntity.getSize());
                product.setProductGroup(productEntity.getProductGroup());
                product.setProductInfo(productEntity.getProductInfo());
                product.setAvgRating(productEntity.getAvgRating());
                product.setDiscount(productEntity.getDiscount());

                productList.add(product);
            }
        }
        return productList;
    }

    @Override
    public List<Product> getProductByDiscount(Category category) throws Exception {

        Query query= entityManager.createQuery(" select p from ProductEntity p where p.category :=category and p.discount>0.0");
        query.setParameter("category", category);

        List<ProductEntity> productEntityList= query.getResultList();
        List<Product> productList= null;

        if(productEntityList!=null && !productEntityList.isEmpty()){

            productList=new ArrayList<>();
            for(ProductEntity productEntity:productEntityList){
                Product product=new Product();
                product.setProductId(productEntity.getProductId());
                product.setProductName(productEntity.getProductName());
                product.setCategory(productEntity.getCategory());
                product.setCost(productEntity.getCost());
                product.setQuantity(productEntity.getQuantity());
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());
                product.setSize(productEntity.getSize());
                product.setProductGroup(productEntity.getProductGroup());
                product.setProductInfo(productEntity.getProductInfo());
                product.setAvgRating(productEntity.getAvgRating());
                product.setDiscount(productEntity.getDiscount());

                productList.add(product);
            }
        }
        return productList;
    }

}
