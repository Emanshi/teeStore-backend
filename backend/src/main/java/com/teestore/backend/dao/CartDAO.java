package com.teestore.backend.dao;

import com.teestore.backend.model.Cart;

public interface CartDAO {
    String addCart (Cart cart) throws Exception;
    String addProductToCart (String cartId, String productId) throws Exception;
    String removeProductFromCart (String cartId, String productId) throws Exception;
    String clearCart (String cartId) throws Exception;
    Cart getCart (String cartId) throws Exception;
    String buyNow (String cartId) throws Exception;
}