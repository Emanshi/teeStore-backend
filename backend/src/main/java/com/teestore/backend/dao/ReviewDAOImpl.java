package com.teestore.backend.dao;

import com.teestore.backend.entity.AddressEntity;
import com.teestore.backend.entity.ProductEntity;
import com.teestore.backend.entity.ReviewEntity;
import com.teestore.backend.entity.UserEntity;
import com.teestore.backend.enums.Rating;
import com.teestore.backend.model.Address;
import com.teestore.backend.model.Product;
import com.teestore.backend.model.Review;
import com.teestore.backend.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository(value = "reviewDAO")
public class ReviewDAOImpl implements ReviewDAO{

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<Review> getReviewByUserId(String userId) throws Exception {

        Query query= entityManager.createQuery("select r from ReviewEntity r where r.user.userId= :userId");
        query.setParameter("userId",userId);

        List<ReviewEntity> reviewEntityList= query.getResultList();
        List<Review> reviewList=null;

        if(reviewEntityList!=null && !reviewEntityList.isEmpty()){

            reviewList=new ArrayList<>();
            for(ReviewEntity reviewEntity: reviewEntityList){
                Review review=new Review();
                review.setReviewId(reviewEntity.getReviewId());
                review.setReviewTitle(reviewEntity.getReviewTitle());
                review.setReviewBody(reviewEntity.getReviewBody());
                review.setReviewDate(reviewEntity.getReviewDate());
                review.setRatings(reviewEntity.getRatings());
                review.setRatingHelpful(reviewEntity.getRatingHelpful());

                UserEntity userEntity= reviewEntity.getUser();

                if(userEntity == null)
                    return null;

                User user =new User();
                user.setUserId(userEntity.getUserId());
                user.setUserName(userEntity.getUserName());
//                user.setPassword(userEntity.getPassword());
//                user.setDateOfBirth(userEntity.getDateOfBirth());
//                user.setContactNumber(userEntity.getContactNumber());
//
//                List<AddressEntity> addressEntityList=userEntity.getAddresses();
//                List<Address> addressList=null;
//
//                if(addressEntityList!=null && !addressEntityList.isEmpty()){
//                    addressList=new ArrayList<>();
//
//                    for(AddressEntity addressEntity: addressEntityList){
//                        Address address=new Address();
//                        address.setAddressId(addressEntity.getAddressId());
//                        address.setStreet(addressEntity.getStreet());
//                        address.setCity(addressEntity.getCity());
//                        address.setState(addressEntity.getState());
//                        address.setPinCode(addressEntity.getPinCode());
//                        addressList.add(address);
//                    }
//                }
//
//                user.setAddresses(addressList);
                review.setUser(user);

                ProductEntity productEntity= reviewEntity.getProduct();

                if(productEntity== null)
                    return null;

                Product product =new Product();
                product.setProductId(productEntity.getProductId());
//                product.setProductInfo(productEntity.getProductInfo());
//                product.setProductGroup(productEntity.getProductGroup());
//                product.setDiscount(productEntity.getDiscount());
//                product.setSize(productEntity.getSize());
//                product.setDateOfAddition(productEntity.getDateOfAddition());
//                product.setAvgRating(productEntity.getAvgRating());
//                product.setSex(productEntity.getSex());
//                product.setCategory(productEntity.getCategory());
//                product.setCost(productEntity.getCost());
                product.setProductName(productEntity.getProductName());
//                product.setQuantity(productEntity.getQuantity());

                review.setProduct(product);

                reviewList.add(review);
            }

        }
        return reviewList;
    }

    @Override
    public List<Review> getReviewByProductId(String productId) throws Exception {

        Query query=entityManager.createQuery("select r from ReviewEntity r where r.product.productId =:productId");
        query.setParameter("productId",productId);

        List<ReviewEntity> reviewEntityList=query.getResultList();
        List<Review> reviewList=null;

        if(reviewEntityList!=null && !reviewEntityList.isEmpty()){

            reviewList=new ArrayList<>();
            for(ReviewEntity reviewEntity: reviewEntityList){
                Review review=new Review();
                review.setReviewId(reviewEntity.getReviewId());
                review.setReviewTitle(reviewEntity.getReviewTitle());
                review.setReviewBody(reviewEntity.getReviewBody());
                review.setReviewDate(reviewEntity.getReviewDate());
                review.setRatings(reviewEntity.getRatings());
                review.setRatingHelpful(reviewEntity.getRatingHelpful());

                UserEntity userEntity= reviewEntity.getUser();

                if(userEntity == null)
                    return null;

                User user =new User();
                user.setUserId(userEntity.getUserId());
                user.setUserName(userEntity.getUserName());
//                user.setPassword(userEntity.getPassword());
//                user.setDateOfBirth(userEntity.getDateOfBirth());
//                user.setContactNumber(userEntity.getContactNumber());
//
//                List<AddressEntity> addressEntityList=userEntity.getAddresses();
//                List<Address> addressList=null;
//
//                if(addressEntityList!=null && !addressEntityList.isEmpty()){
//                    addressList=new ArrayList<>();
//
//                    for(AddressEntity addressEntity: addressEntityList){
//                        Address address=new Address();
//                        address.setAddressId(addressEntity.getAddressId());
//                        address.setStreet(addressEntity.getStreet());
//                        address.setCity(addressEntity.getCity());
//                        address.setState(addressEntity.getState());
//                        address.setPinCode(addressEntity.getPinCode());
//                        addressList.add(address);
//                    }
//                }
//
//                user.setAddresses(addressList);
                review.setUser(user);

                ProductEntity productEntity= reviewEntity.getProduct();

                if(productEntity== null)
                    return null;

                Product product =new Product();
                product.setProductId(productEntity.getProductId());
//                product.setProductInfo(productEntity.getProductInfo());
//                product.setProductGroup(productEntity.getProductGroup());
//                product.setDiscount(productEntity.getDiscount());
//                product.setSize(productEntity.getSize());
//                product.setDateOfAddition(productEntity.getDateOfAddition());
//                product.setAvgRating(productEntity.getAvgRating());
//                product.setSex(productEntity.getSex());
//                product.setCategory(productEntity.getCategory());
//                product.setCost(productEntity.getCost());
                product.setProductName(productEntity.getProductName());
//                product.setQuantity(productEntity.getQuantity());

                review.setProduct(product);

                reviewList.add(review);
            }

        }
        return reviewList;

    }

    @Override
    public String addReview(Review review) throws Exception {

        if(review== null)
            return null;

        User user=review.getUser();

        if(user == null || user.getUserId()== null)
            return null;

        Product product=review.getProduct();

        if(product == null || product.getProductId() ==null)
            return null;

        UserEntity userEntity= entityManager.find(UserEntity.class, user.getUserId());

        if(userEntity== null)
            return null;

        ProductEntity productEntity= entityManager.find(ProductEntity.class, product.getProductId());

        if(productEntity ==null)
            return null;

        ReviewEntity reviewEntity=new ReviewEntity();
        reviewEntity.setUser(userEntity);
        reviewEntity.setProduct(productEntity);
        reviewEntity.setReviewTitle(review.getReviewTitle());
        reviewEntity.setReviewBody(review.getReviewBody());
        reviewEntity.setReviewDate(review.getReviewDate());
        reviewEntity.setRatingHelpful(0);
        reviewEntity.setRatings(review.getRatings());

        Rating rating= review.getRatings();
        Integer ratingInNo=null;
        if(rating == Rating.ONE)
            ratingInNo=1;
        else if(rating == Rating.TWO)
            ratingInNo=2;
        else if(rating == Rating.THREE)
            ratingInNo=3;
        else if(rating == Rating.FOUR)
            ratingInNo=4;
        else if(rating == Rating.FIVE)
            ratingInNo=5;

        String avgRating= productEntity.getAvgRating();
        String[] ratingParameter = avgRating.split("\\.",2);
        Integer noOfRatings= Integer.parseInt(ratingParameter[0]);
        Double avgRatingInNo= Math.round(((Double.parseDouble(ratingParameter[1])*noOfRatings + ratingInNo)/(noOfRatings+1))*10)/10.0 ;
        noOfRatings+=1;
        String newAvgRating= noOfRatings.toString()+"." + avgRatingInNo.toString();

        productEntity.setAvgRating(newAvgRating);

        entityManager.persist(productEntity);
        entityManager.persist(reviewEntity);

        return reviewEntity.getReviewId();
    }

    @Override
    public String editReview(String reviewId,Review review) throws Exception {

        ReviewEntity reviewEntity = entityManager.find(ReviewEntity.class, reviewId);

        if(reviewEntity ==null)
            return null;

        if(review.getReviewTitle()!=null)
            reviewEntity.setReviewTitle(review.getReviewTitle());

        if(review.getReviewBody()!=null)
            reviewEntity.setReviewBody(review.getReviewBody());

        if(review.getReviewDate()!=null)
            reviewEntity.setReviewDate(review.getReviewDate());

        if(review.getRatings()!=null) {

            reviewEntity.setRatings(review.getRatings());
            Product product=review.getProduct();

            if(product == null || product.getProductId() ==null)
                return null;

            UserEntity userEntity= entityManager.find(UserEntity.class, review.getUser().getUserId());

            if(userEntity== null)
                return null;

            ProductEntity productEntity= entityManager.find(ProductEntity.class, product.getProductId());

            if(productEntity ==null)
                return null;

            Rating rating = review.getRatings();
            Integer ratingInNo = null;
            if (rating == Rating.ONE)
                ratingInNo = 1;
            else if (rating == Rating.TWO)
                ratingInNo = 2;
            else if (rating == Rating.THREE)
                ratingInNo = 3;
            else if (rating == Rating.FOUR)
                ratingInNo = 4;
            else if (rating == Rating.FIVE)
                ratingInNo = 5;

            String avgRating = productEntity.getAvgRating();
            String[] ratingParameter = avgRating.split("\\.", 2);
            Integer noOfRatings = Integer.parseInt(ratingParameter[0]);
            Double avgRatingInNo = Math.round(((Double.parseDouble(ratingParameter[1]) * noOfRatings + ratingInNo) / (noOfRatings + 1)) * 10) / 10.0;
            noOfRatings += 1;
            String newAvgRating = noOfRatings.toString() + "." + avgRatingInNo.toString();

            productEntity.setAvgRating(newAvgRating);
            reviewEntity.setProduct(productEntity);
            entityManager.persist(productEntity);
        }

        entityManager.persist(reviewEntity);
        return reviewEntity.getReviewId();
    }

    @Override
    public String deleteReview(String reviewId) throws Exception {

        ReviewEntity reviewEntity= entityManager.find(ReviewEntity.class, reviewId);

        String rId=null;

        if(reviewEntity!= null) {
            reviewEntity.setUser(null);
            reviewEntity.setProduct(null);
            entityManager.remove(reviewEntity);
            rId=reviewEntity.getReviewId();
        }

        return rId;
    }

    @Override
    public Integer reviewHelpful(String reviewId) throws Exception {

        ReviewEntity reviewEntity= entityManager.find(ReviewEntity.class, reviewId);
        Integer noOfHelpfulLikes=null;

        if(reviewEntity==null || reviewEntity.getUser()==null )
            return null;

        reviewEntity.setRatingHelpful(reviewEntity.getRatingHelpful()+1);

        return null;
    }

    @Override
    public List<Review> getReviewByRating(String productId, Rating rating) throws Exception {

        Query query= entityManager.createQuery("select r from ReviewEntity r where r.product.productId =:productId and r.ratings=:rating");
        query.setParameter("productId",productId);
        query.setParameter("rating",rating);

        List<ReviewEntity> reviewEntityList= query.getResultList();
        List<Review> reviewList=null;

        if(reviewEntityList!=null && !reviewEntityList.isEmpty()){

            reviewList=new ArrayList<>();
            for(ReviewEntity reviewEntity: reviewEntityList){
                Review review=new Review();
                review.setReviewId(reviewEntity.getReviewId());
                review.setReviewTitle(reviewEntity.getReviewTitle());
                review.setReviewBody(reviewEntity.getReviewBody());
                review.setReviewDate(reviewEntity.getReviewDate());
                review.setRatings(reviewEntity.getRatings());
                review.setRatingHelpful(reviewEntity.getRatingHelpful());

                UserEntity userEntity= reviewEntity.getUser();

                if(userEntity == null)
                    return null;

                User user =new User();
                user.setUserId(userEntity.getUserId());
                user.setUserName(userEntity.getUserName());
//                user.setPassword(userEntity.getPassword());
//                user.setDateOfBirth(userEntity.getDateOfBirth());
//                user.setContactNumber(userEntity.getContactNumber());

//                List<AddressEntity> addressEntityList=userEntity.getAddresses();
//                List<Address> addressList=null;
//
//                if(addressEntityList!=null && !addressEntityList.isEmpty()){
//                    addressList=new ArrayList<>();
//
//                    for(AddressEntity addressEntity: addressEntityList){
//                        Address address=new Address();
//                        address.setAddressId(addressEntity.getAddressId());
//                        address.setStreet(addressEntity.getStreet());
//                        address.setCity(addressEntity.getCity());
//                        address.setState(addressEntity.getState());
//                        address.setPinCode(addressEntity.getPinCode());
//                        addressList.add(address);
//                    }
//                }
//
//                user.setAddresses(addressList);
                review.setUser(user);

//                ProductEntity productEntity= reviewEntity.getProduct();
//
//                if(productEntity== null)
//                    return null;
//
                Product product =new Product();
                product.setProductId(productId);
//                product.setProductInfo(productEntity.getProductInfo());
//                product.setProductGroup(productEntity.getProductGroup());
//                product.setDiscount(productEntity.getDiscount());
//                product.setSize(productEntity.getSize());
//                product.setDateOfAddition(productEntity.getDateOfAddition());
//                product.setAvgRating(productEntity.getAvgRating());
//                product.setSex(productEntity.getSex());
//                product.setCategory(productEntity.getCategory());
//                product.setCost(productEntity.getCost());
//                product.setProductName(productEntity.getProductName());
//                product.setQuantity(productEntity.getQuantity());

                review.setProduct(product);

                reviewList.add(review);
            }

        }
        return reviewList;
    }
}
