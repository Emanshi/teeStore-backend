package com.teestore.backend.api;

import com.teestore.backend.model.Cart;
import com.teestore.backend.model.Order;
import com.teestore.backend.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("OrdersAPI")
public class OrdersAPI {

    @Autowired
    OrdersService ordersService;

    @PostMapping("/buyNow")
    public ResponseEntity<String> buyNow (@RequestBody Cart cartId) throws Exception {
        try {
            String res = ordersService.buyNow(cartId);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, e.getMessage());
        }
    }

    @GetMapping("/getOrder")
    public ResponseEntity<Order> getCart (@RequestParam String orderId) throws Exception {
        try {
            Order res = ordersService.getOrder(orderId);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
    }

    @GetMapping("/getOrderByUserId")
    public ResponseEntity<List<Order>> getOrdersByUserId (@RequestParam String userId) throws Exception {
        try {
            List<Order> res = ordersService.getOrdersByUserId(userId);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
    }
}
