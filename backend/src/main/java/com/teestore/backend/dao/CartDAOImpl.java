package com.teestore.backend.dao;

import com.teestore.backend.entity.CartEntity;
import com.teestore.backend.entity.UserEntity;
import com.teestore.backend.model.Cart;
import com.teestore.backend.model.Product;
import com.teestore.backend.model.User;
import com.teestore.backend.service.OrdersService;
import com.teestore.backend.service.ProductService;
import com.teestore.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {

    @Autowired
    private EntityManager entityManager;

    @Autowired
    private UserService userDAO;

    @Autowired
    private ProductService productDAO;

    @Autowired
    private OrdersService ordersDAO;

    @Override
    public String addCart(Cart cart) throws Exception {
        String id = null;

        if (cart.getProducts() != null && !cart.getProducts().isEmpty()) {
            StringBuilder products = new StringBuilder();
            for (Product p:cart.getProducts()) {
                products.append(p.getProductId()).append(",");
            }
            StringBuilder qty = new StringBuilder();
            for (Integer i:cart.getQuantities()) {
                qty.append(i).append(",");
            }

            UserEntity user = entityManager.find(UserEntity.class, cart.getUser().getUserId());

            if (user != null) {
                CartEntity entity = new CartEntity();
                entity.setProductIds(products.toString());
                entity.setQuantities(qty.toString());
                entity.setTotalCost(cart.getTotalCost());
                entity.setUser(user);

                entityManager.persist(entity);

                id = entity.getCartId();
            }
        }

        return id;
    }

    @Override
    public String addProductToCart(String cartId, String productId) throws Exception {
        return null;
    }

    @Override
    public String removeProductFromCart(String cartId, String productId) throws Exception {
        return null;
    }

    @Override
    public String clearCart(String cartId) throws Exception {
        String id = null;

        CartEntity entity = entityManager.find(CartEntity.class, cartId);

        if (entity != null) {
            entityManager.remove(entity);
            id = entity.getCartId();
        }
        return id;
    }

    @Override
    public Cart getCart(String cartId) throws Exception {
        CartEntity entity = entityManager.find(CartEntity.class, cartId);
        Cart cart = null;
        List<Product> products = null;
        List<Integer> qty = null;
        if (entity != null) {
            User user = userDAO.getUser(entity.getUser().getUserId());
            if (user != null) {
                cart = new Cart();
                cart.setTotalCost(entity.getTotalCost());
                cart.setUser(user);
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
                cart.setQuantities(qty);
                cart.setProducts(products);
                cart.setCartId(entity.getCartId());
            }
        }
        return cart;
    }

    @Override
    public String buyNow(String cartId) throws Exception {
        Cart cart = getCart(cartId);
        return ordersDAO.buyNow(cart);
    }
}
