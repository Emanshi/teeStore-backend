package com.teestore.backend.service;

import com.teestore.backend.dao.CartDAO;
import com.teestore.backend.model.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service(value = "cartService")
@Transactional
public class CartServiceImpl implements CartService {

    @Autowired
    CartDAO cartDAO;

    @Override
    public String addCart(Cart cart) throws Exception {
        if (cart == null)
            throw new Exception("CartService.INVALID_CART");
        String res = cartDAO.addCart(cart);
        if (res == null)
            throw new Exception("CartService.UNABLE_TO_ADD_CART");
        return res;
    }

    @Override
    public String addProductToCart(String cartId, String productId) throws Exception {
        if (cartId == null || productId == null || cartId.equals("") || productId.equals(""))
            throw new Exception("CartService.INVALID_CART_ID");
        String res = cartDAO.addProductToCart(cartId, productId);
        if (res == null)
            throw new Exception("CartService.UNABLE_TO_ADD_PRODUCT_TO_CART");
        return res;
    }

    @Override
    public String removeProductFromCart(String cartId, String productId) throws Exception {
        if (cartId == null || productId == null || cartId.equals("") || productId.equals(""))
            throw new Exception("CartService.INVALID_CART_ID");
        String res = cartDAO.removeProductFromCart(cartId, productId);
        if (res == null)
            throw new Exception("CartService.UNABLE_TO_REMOVE_PRODUCT_FROM_CART");
        return res;
    }

    @Override
    public String clearCart(String cartId) throws Exception {
        if (cartId == null || cartId.equals(""))
            throw new Exception("CartService.INVALID_CART_ID");
        String res = cartDAO.clearCart(cartId);
        if (res == null)
            throw new Exception("CartService.UNABLE_TO_CLEAR_CART");
        return res;
    }

    @Override
    public Cart getCart(String cartId) throws Exception {
        if (cartId == null || cartId.equals(""))
            throw new Exception("CartService.INVALID_CART_ID");
        Cart res = cartDAO.getCart(cartId);
        if (res == null)
            throw new Exception("CartService.UNABLE_TO_RETRIEVE_CART");
        return res;
    }

    @Override
    public String buyNow(String cartId) throws Exception {
        if (cartId == null || cartId.equals(""))
            throw new Exception("CartService.INVALID_CART_ID");
        String res = cartDAO.buyNow(cartId);
        if (res == null)
            throw new Exception("CartService.UNABLE_TO_PLACE_ORDER");
        return res;
    }
}
