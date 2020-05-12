package com.teestore.backend.service;

import com.teestore.backend.model.Cart;

public interface CartService {
    String addCart (Cart cart) throws Exception;
    String addProductToCart (String cartId, String productId) throws Exception;
    String removeProductFromCart (String cartId, String productId) throws Exception;
    String clearCart (String cartId) throws Exception;
    Cart getCart (String cartId) throws Exception;
    String buyNow (String cartId) throws Exception;
}
