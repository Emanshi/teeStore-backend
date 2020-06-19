package com.teestore.backend.dao;

import com.teestore.backend.entity.ProductEntity;
import com.teestore.backend.enums.Category;
import com.teestore.backend.model.Product;
import com.teestore.backend.service.ImagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository(value= "productDAO")
public class ProductDAOImpl implements ProductDAO{

    @Autowired
    private EntityManager entityManager;

    @Autowired
    private ImagesService imagesService;

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
        product.setDateOfAddition(productEntity.getDateOfAddition());
        product.setSex(productEntity.getSex());

        Map<String,Integer> sizeMap= new HashMap<>();
        String[] sizes=productEntity.getSize().split(",");
        String[] quantities=productEntity.getQuantity().split(",");

        for(int i=0;i<sizes.length;i++){
            sizeMap.put(sizes[i],Integer.parseInt(quantities[i]));
        }
        product.setSizeAndQuantity(sizeMap);
        product.setProductInfo(productEntity.getProductInfo());
        product.setDiscount(productEntity.getDiscount());
        product.setTotalRaters(productEntity.getAvgRating().split("\\.")[1]);
        double rating = Double.parseDouble(productEntity.getAvgRating().split("\\.")[0]);
        rating = rating/(Integer.parseInt(product.getTotalRaters()));
        product.setAvgRating(String.valueOf(rating));

        product.setImages(imagesService.getImagesByReference(product.getProductId()));

        return product;
    }

    @Override
    public List<Product> getProductsByCategory(Category category) throws Exception {

        Query query= entityManager.createQuery("select p from ProductEntity p where p.category =:category");
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
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());

                Map<String,Integer> sizeMap= new HashMap<>();
                String[] sizes=productEntity.getSize().split(",");
                String[] quantities=productEntity.getQuantity().split(",");

                for(int i=0;i<sizes.length;i++){
                    sizeMap.put(sizes[i],Integer.parseInt(quantities[i]));
                }
                product.setSizeAndQuantity(sizeMap);
                product.setProductInfo(productEntity.getProductInfo());
                product.setDiscount(productEntity.getDiscount());
                product.setTotalRaters(productEntity.getAvgRating().split("\\.")[1]);
                double rating = Double.parseDouble(productEntity.getAvgRating().split("\\.")[0]);
                rating = rating/(Integer.parseInt(product.getTotalRaters()));
                product.setAvgRating(String.valueOf(rating));

                product.setImages(imagesService.getImagesByReference(product.getProductId()));

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
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());

                Map<String,Integer> sizeMap= new HashMap<>();
                String[] sizes=productEntity.getSize().split(",");
                String[] quantities=productEntity.getQuantity().split(",");

                for(int i=0;i<sizes.length;i++){
                    sizeMap.put(sizes[i],Integer.parseInt(quantities[i]));
                }
                product.setSizeAndQuantity(sizeMap);
                product.setProductInfo(productEntity.getProductInfo());
                product.setTotalRaters(productEntity.getAvgRating().split("\\.")[1]);
                double rating = Double.parseDouble(productEntity.getAvgRating().split("\\.")[0]);
                rating = rating/(Integer.parseInt(product.getTotalRaters()));
                product.setAvgRating(String.valueOf(rating));
                product.setDiscount(productEntity.getDiscount());

                product.setImages(imagesService.getImagesByReference(product.getProductId()));

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
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());

                Map<String,Integer> sizeMap= new HashMap<>();
                String[] sizes=productEntity.getSize().split(",");
                String[] quantities=productEntity.getQuantity().split(",");

                for(int i=0;i<sizes.length;i++){
                    sizeMap.put(sizes[i],Integer.parseInt(quantities[i]));
                }
                product.setSizeAndQuantity(sizeMap);
                product.setProductInfo(productEntity.getProductInfo());
                product.setTotalRaters(productEntity.getAvgRating().split("\\.")[1]);
                double rating = Double.parseDouble(productEntity.getAvgRating().split("\\.")[0]);
                rating = rating/(Integer.parseInt(product.getTotalRaters()));
                product.setAvgRating(String.valueOf(rating));
                product.setDiscount(productEntity.getDiscount());

                product.setImages(imagesService.getImagesByReference(product.getProductId()));

                productList.add(product);
            }
        }
        return productList;
    }

    @Override
    public List<Product> getProductByDiscount(Category category) throws Exception {

        Query query= entityManager.createQuery("select p from ProductEntity p where p.category =:category and p.discount>0.0");
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
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());

                Map<String,Integer> sizeMap= new HashMap<>();
                String[] sizes=productEntity.getSize().split(",");
                String[] quantities=productEntity.getQuantity().split(",");

                for(int i=0;i<sizes.length;i++){
                    sizeMap.put(sizes[i],Integer.parseInt(quantities[i]));
                }
                product.setSizeAndQuantity(sizeMap);
                product.setProductInfo(productEntity.getProductInfo());
                product.setTotalRaters(productEntity.getAvgRating().split("\\.")[1]);
                double rating = Double.parseDouble(productEntity.getAvgRating().split("\\.")[0]);
                rating = rating/(Integer.parseInt(product.getTotalRaters()));
                product.setAvgRating(String.valueOf(rating));
                product.setDiscount(productEntity.getDiscount());

                product.setImages(imagesService.getImagesByReference(product.getProductId()));

                productList.add(product);
            }
        }
        return productList;
    }

    @Override
    public List<Product> getProductBySearchQuery(String search) throws Exception {
        Query query= entityManager.createQuery("select p from ProductEntity p where lower(p.productName) like :search or lower(p.productInfo) like :search");
        query.setParameter("search", "%"+search.toLowerCase()+"%");

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
                product.setDateOfAddition(productEntity.getDateOfAddition());
                product.setSex(productEntity.getSex());

                Map<String,Integer> sizeMap= new HashMap<>();
                String[] sizes=productEntity.getSize().split(",");
                String[] quantities=productEntity.getQuantity().split(",");

                for(int i=0;i<sizes.length;i++){
                    sizeMap.put(sizes[i],Integer.parseInt(quantities[i]));
                }
                product.setSizeAndQuantity(sizeMap);
                product.setProductInfo(productEntity.getProductInfo());
                product.setTotalRaters(productEntity.getAvgRating().split("\\.")[1]);
                double rating = Double.parseDouble(productEntity.getAvgRating().split("\\.")[0]);
                rating = rating/(Integer.parseInt(product.getTotalRaters()));
                product.setAvgRating(String.valueOf(rating));
                product.setDiscount(productEntity.getDiscount());

                product.setImages(imagesService.getImagesByReference(product.getProductId()));

                productList.add(product);
            }
        }
        return productList;
    }

}
