package com.teestore.backend.service;

import com.teestore.backend.model.Cart;
import com.teestore.backend.model.Order;

import java.util.List;

public interface OrdersService {
    String buyNow (Cart cart) throws Exception;
    Order getOrder (String orderId) throws Exception;
    List<Order> getOrdersByUserId (String userId) throws Exception;
}
