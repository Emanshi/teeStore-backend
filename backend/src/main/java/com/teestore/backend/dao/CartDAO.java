package com.teestore.backend.dao;

import com.teestore.backend.model.Cart;

public interface CartDAO {
    String addCart (Cart cart) throws Exception;
    Integer addProductToCart (String userId, String productId) throws Exception;
    String removeProductFromCart (String cartId, String productId) throws Exception;
    String clearCart (String cartId) throws Exception;
    Cart getCart (String cartId) throws Exception;
    String buyNow (String cartId) throws Exception;
}