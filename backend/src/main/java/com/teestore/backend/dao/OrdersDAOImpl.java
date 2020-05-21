package com.teestore.backend.dao;

import com.teestore.backend.entity.OrdersEntity;
import com.teestore.backend.entity.ProductEntity;
import com.teestore.backend.entity.UserEntity;
import com.teestore.backend.model.Cart;
import com.teestore.backend.model.Order;
import com.teestore.backend.model.Product;
import com.teestore.backend.model.User;
import com.teestore.backend.service.ProductService;
import com.teestore.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Repository(value = "ordersDAO")
public class OrdersDAOImpl implements OrdersDAO {

    @Autowired
    private EntityManager entityManager;

    @Autowired
    private UserService userDAO;

    @Autowired
    private ProductService productDAO;

    @Override
    public String buyNow(Cart cart) throws Exception {
        String id = null;

        if (cart.getProducts() != null && !cart.getProducts().isEmpty()) {
            StringBuilder products = new StringBuilder();
            for (Product p:cart.getProducts()) {
                ProductEntity pe = entityManager.find(ProductEntity.class, p.getProductId());
                if (pe.getQuantity() < p.getQuantity())
                    return null;
                else
                    pe.setQuantity(pe.getQuantity() - p.getQuantity());
                products.append(p.getProductId()).append(",");
            }
            StringBuilder qty = new StringBuilder();
            for (Integer i:cart.getQuantities()) {
                qty.append(i).append(",");
            }

            UserEntity user = entityManager.find(UserEntity.class, cart.getUser().getUserId());

            if (user != null) {
                OrdersEntity entity = new OrdersEntity();
                entity.setProductIds(products.toString());
                entity.setQuantities(qty.toString());
                entity.setTotalCost(cart.getTotalCost());
                entity.setTimeOfOrder(LocalDateTime.now());
                entity.setUser(user);

                entityManager.persist(entity);

                id = entity.getOrderId();
            }
        }

        return id;
    }

    @Override
    public Order getOrder(String orderId) throws Exception {
        OrdersEntity entity = entityManager.find(OrdersEntity.class, orderId);
        Order orders = null;
        List<Product> products = null;
        List<Integer> qty = null;
        if (entity != null) {
            User user = userDAO.getUser(entity.getUser().getUserId());
            if (user != null) {
                orders = new Order();
                orders.setTotalCost(entity.getTotalCost());
                orders.setUser(user);
                String productIds = entity.getProductIds();
                String[] ids = productIds.split(",");
                String[] qs = entity.getQuantities().split(",");
                if (ids.length > 0) {
                    products = new ArrayList<>();
                    qty = new ArrayList<>();
                    for (String id:ids) {
                        Product p = productDAO.getProductById(id);
                        products.add(p);
                    }
                    for (String q:qs) {
                        qty.add(Integer.parseInt(q));
                    }
                }
                orders.setQuantities(qty);
                orders.setProducts(products);
                orders.setTimeOfOrder(entity.getTimeOfOrder());
                orders.setOrderId(entity.getOrderId());
            }
        }
        return orders;
    }

    @Override
    public List<Order> getOrdersByUserId(String userId) throws Exception {
        Query query = entityManager.createQuery("select o from OrdersEntity o where o.user.userId = :userId");
        query.setParameter("userId", userId);
        List<OrdersEntity> entities = query.getResultList();
        List<Order> orders = null;

        if (entities != null && !entities.isEmpty()) {
            Order order = null;
            orders = new ArrayList<>();

            for (OrdersEntity entity:entities) {
                List<Product> products = null;
                List<Integer> qty = null;
                if (entity != null) {
                    User user = userDAO.getUser(entity.getUser().getUserId());
                    if (user != null) {
                        order = new Order();
                        order.setTotalCost(entity.getTotalCost());
                        order.setUser(user);
                        String productIds = entity.getProductIds();
                        String[] ids = productIds.split(",");
                        String[] qs = entity.getQuantities().split(",");
                        if (ids.length > 0) {
                            products = new ArrayList<>();
                            qty = new ArrayList<>();
                            for (String id : ids) {
                                Product p = productDAO.getProductById(id);
                                products.add(p);
                            }
                            for (String q : qs) {
                                qty.add(Integer.parseInt(q));
                            }
                        }
                        order.setQuantities(qty);
                        order.setProducts(products);
                        order.setTimeOfOrder(entity.getTimeOfOrder());
                        order.setOrderId(entity.getOrderId());
                    }
                }
            }
            orders.add(order);
        }

        return orders;
    }
}
