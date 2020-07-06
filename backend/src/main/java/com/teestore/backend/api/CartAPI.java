package com.teestore.backend.api;

import com.teestore.backend.model.Cart;
import com.teestore.backend.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@CrossOrigin
@RestController
@RequestMapping("CartAPI")
public class CartAPI {

    @Autowired
    private CartService cartService;

    @PostMapping("/addCart")
    public ResponseEntity<String> addCart (@RequestBody Cart cart) throws Exception {
        try {
            String res = cartService.addCart(cart);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, e.getMessage());
        }
    }

    @GetMapping("/addProduct")
    public ResponseEntity<Integer> addProductToCart (@RequestParam String userId, @RequestParam String productId) throws Exception {
        try {
            Integer res = cartService.addProductToCart(userId, productId);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, e.getMessage());
        }
    }

    @DeleteMapping("/removeProduct")
    public ResponseEntity<String> removeProductFromCart (@RequestParam String cartId, @RequestParam String productId) throws Exception {
        try {
            String res = cartService.removeProductFromCart(cartId, productId);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, e.getMessage());
        }
    }

    @DeleteMapping("/clearCart/{cartId}")
    public ResponseEntity<String> clearCart (@PathVariable String cartId) throws Exception {
        try {
            String res = cartService.clearCart(cartId);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, e.getMessage());
        }
    }

    @GetMapping("/getCart")
    public ResponseEntity<Cart> getCart (@RequestParam String userId) throws Exception {
        try {
            Cart res = cartService.getCart(userId);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
    }

    @PostMapping("/buyNow")
    public ResponseEntity<String> buyNow (@RequestParam String cartId) throws Exception {
        try {
            String res = cartService.buyNow(cartId);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, e.getMessage());
        }
    }
}
