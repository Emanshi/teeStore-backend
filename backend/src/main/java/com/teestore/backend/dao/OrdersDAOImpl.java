package com.teestore.backend.dao;

import com.teestore.backend.entity.CartEntity;
import com.teestore.backend.entity.OrdersEntity;
import com.teestore.backend.entity.ProductEntity;
import com.teestore.backend.entity.UserEntity;
import com.teestore.backend.model.Cart;
import com.teestore.backend.model.Order;
import com.teestore.backend.model.Product;
import com.teestore.backend.model.User;
import com.teestore.backend.service.CartService;
import com.teestore.backend.service.ProductService;
import com.teestore.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Repository(value = "ordersDAO")
public class OrdersDAOImpl implements OrdersDAO {

    @Autowired
    private EntityManager entityManager;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    @Override
    public String buyNow(Cart cart) throws Exception {
        String id = null;

        if (cart.getProducts() != null && !cart.getProducts().isEmpty()) {
            StringBuilder products = new StringBuilder();
            StringBuilder qty = new StringBuilder();
            StringBuilder sizes = new StringBuilder();
            StringBuilder prices = new StringBuilder();
            List<Product> productList = cart.getProducts();
            List<Integer> qtyList = cart.getQuantities();
            List<String>  sizesList=cart.getSizes();

            for (int i=0;i< productList.size();i++) {
                ProductEntity pe = entityManager.find(ProductEntity.class,productList.get(i).getProductId());
                String[] quantity = pe.getQuantity().split(",");
                String[] size = pe.getSize().split(",");
                Integer index = Arrays.asList(size).indexOf(sizesList.get(i));
                if(index >= 0 && index < size.length) {
                    if (Integer.parseInt(quantity[index]) < qtyList.get(i)) {
                        return null;
                    }
                    else {
                        quantity[index]=String.valueOf(Integer.parseInt(quantity[index]) - qtyList.get(i));
                        StringBuilder s = new StringBuilder();
                        for(String q : quantity){
                            s.append(q).append(',');
                        }
                        pe.setQuantity(s.toString().substring(0,s.length()-1));
                    }
                }
                else{
                    return null;
                }
                products.append(productList.get(i).getProductId()).append(",");
                qty.append(qtyList.get(i)).append(",");
                sizes.append(sizesList.get(i)).append(",");
                prices.append(productList.get(i).getCost()*(1-(productList.get(i).getDiscount())/100)).append(",");
            }

            UserEntity user = entityManager.find(UserEntity.class, cart.getUser().getUserId());

            if (user != null) {
                OrdersEntity entity = new OrdersEntity();
                entity.setProductIds(products.toString().substring(0,products.length()-1));
                entity.setQuantities(qty.toString().substring(0,qty.length()-1));
                entity.setSizes(sizes.toString().substring(0,sizes.length()-1));
                entity.setPrices(prices.toString().substring(0,prices.length()-1));
                entity.setTotalCost(cart.getTotalCost());
                entity.setTimeOfOrder(LocalDateTime.now());
                entity.setUser(user);

                entityManager.persist(entity);
                Cart c=cartService.clearCart(cart.getCartId());
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
        List<String> size = null;
        List<Double> price = null;
        if (entity != null) {
            User user = userService.getUser(entity.getUser().getUserId());
            if (user != null) {
                orders = new Order();
                orders.setTotalCost(entity.getTotalCost());
                orders.setUser(user);
                String[] ids = entity.getProductIds().split(",");
                String[] qs = entity.getQuantities().split(",");
                String[] si = entity.getSizes().split(",");
                String[] pr = entity.getPrices().split(",");
                if (ids.length > 0) {
                    products = new ArrayList<>();
                    qty = new ArrayList<>();
                    for (String id:ids) {
                        Product p = productService.getProductById(id);
                        products.add(p);
                    }
                    for (String q:qs) {
                        qty.add(Integer.parseInt(q));
                    }
                    for (String s : si) {
                        size.add(s);
                    }
                    for (String p : pr) {
                        price.add(Double.parseDouble(p));
                    }
                }
                orders.setQuantities(qty);
                orders.setProducts(products);
                orders.setSizes(size);
                orders.setPrices(price);
                orders.setTotalCost(entity.getTotalCost());
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
                List<String> size = null;
                List<Double> price = null;
                if (entity != null) {
                    User user = userService.getUser(entity.getUser().getUserId());
                    if (user != null) {
                        order = new Order();
                        order.setTotalCost(entity.getTotalCost());
                        order.setUser(user);
                        String[] ids = entity.getProductIds().split(",");
                        String[] qs = entity.getQuantities().split(",");
                        String[] si = entity.getSizes().split(",");
                        String[] pr = entity.getPrices().split(",");
                        if (ids.length > 0) {
                            products = new ArrayList<>();
                            qty = new ArrayList<>();
                            size = new ArrayList<>();
                            price = new ArrayList<>();
                            for (String id : ids) {
                                Product product = productService.getProductById(id);
                                products.add(product);
                            }
                            for (String q : qs) {
                                qty.add(Integer.parseInt(q));
                            }
                            for (String s : si) {
                                size.add(s);
                            }
                            for (String p : pr) {
                                price.add(Double.parseDouble(p));
                            }
                        }
                        order.setQuantities(qty);
                        order.setProducts(products);
                        order.setSizes(size);
                        order.setPrices(price);
                        order.setTotalCost(entity.getTotalCost());
                        order.setTimeOfOrder(entity.getTimeOfOrder());
                        order.setOrderId(entity.getOrderId());
                        orders.add(order);
                    }
                }
            }
        }
        return orders;
    }
}
