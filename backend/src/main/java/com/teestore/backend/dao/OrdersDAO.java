package com.teestore.backend.dao;

import com.teestore.backend.model.Cart;
import com.teestore.backend.model.Order;

import java.util.List;

public interface OrdersDAO {
    String buyNow (Cart cart) throws Exception;
    Order getOrder (String orderId) throws Exception;
    List<Order> getOrdersByUserId (String userId) throws Exception;
}
