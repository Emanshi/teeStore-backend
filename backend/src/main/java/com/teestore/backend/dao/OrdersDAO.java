package com.teestore.backend.dao;

import com.teestore.backend.model.Order;

import java.util.List;

public interface OrdersDAO {
    String buyNow (Order order) throws Exception;
    List<Order> getOrdersByUserId (String userId) throws Exception;
}
