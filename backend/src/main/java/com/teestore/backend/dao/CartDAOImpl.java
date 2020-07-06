package com.teestore.backend.dao;

import com.teestore.backend.entity.CartEntity;
import com.teestore.backend.entity.UserEntity;
import com.teestore.backend.model.Cart;
import com.teestore.backend.model.Product;
import com.teestore.backend.model.User;
import com.teestore.backend.service.CartService;
import com.teestore.backend.service.OrdersService;
import com.teestore.backend.service.ProductService;
import com.teestore.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository(value = "cartDAO")
public class CartDAOImpl implements CartDAO {

    @Autowired
    private EntityManager entityManager;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private CartService cartService;

    @Override
    public String addCart(Cart cart) throws Exception {
        String id = null;

//        if (cart.getProducts() != null && !cart.getProducts().isEmpty()) {
//            StringBuilder products = new StringBuilder();
//            for (Product p:cart.getProducts()) {
//                products.append(p.getProductId()).append(",");
//            }
//            StringBuilder qty = new StringBuilder();
//            for (Integer i:cart.getQuantities()) {
//                qty.append(i).append(",");
//            }

            UserEntity user = entityManager.find(UserEntity.class, cart.getUser().getUserId());

            if (user != null) {
                CartEntity entity = new CartEntity();
//                entity.setProductIds(products.toString());
//                entity.setQuantities(qty.toString());
//                entity.setTotalCost(cart.getTotalCost());
                entity.setUser(user);

                entityManager.persist(entity);

                id = entity.getCartId();
//            }
        }

        return id;
    }

    @Override
    public Integer addProductToCart(String userId, String productId) throws Exception {
        Integer i = null;

        Query query= entityManager.createQuery("select c from CartEntity c where c.user.userId=:userId");
        query.setParameter("userId",userId);

        CartEntity entity = (CartEntity)query.getResultList().get(0);

        if (entity == null) {

            Cart c = new Cart();
            User u = new User();

            u.setUserId(userId);
            c.setUser(u);
            String cartId = cartService.addCart(c);

            entity = entityManager.find(CartEntity.class, cartId);

            entity.setProductIds(productId);
            entity.setQuantities("1");

            entityManager.persist(entity);
            i=1;
        }
        else {
            boolean exists = entity.getProductIds().contains(productId);

            if (exists) {
                return 0;
            }

            entity.setProductIds(entity.getProductIds() + "," + productId);
            entity.setQuantities(entity.getQuantities() + ",1");

            entityManager.persist(entity);
            i=1;
        }

        return i;
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
    public Cart getCart(String userId) throws Exception {
        Query query= entityManager.createQuery("select c from CartEntity c where c.user.userId=:userId");
        query.setParameter("userId",userId);

        CartEntity entity = (CartEntity)query.getResultList().get(0);

        Cart cart = null;
        List<Product> products = null;
        List<Integer> qty = null;
        if (entity != null) {
            User user = userService.getUser(entity.getUser().getUserId());
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
                        if (id.equals(""))
                            continue;
                        Product p = productService.getProductById(id);
                        products.add(p);
                    }
                    for (String q:qs) {
                        if (q.equals(""))
                            continue;
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
        return ordersService.buyNow(cart);
    }
}
