package com.teestore.backend.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "Orders")
public class OrdersEntity {

    @Id
    @GenericGenerator(name = "oIdGen", strategy = "com.teestore.backend.entity.generator.OrderIdGenerator")
    @GeneratedValue(generator = "oIdGen")
    @Column(length = 5)
    private String orderId;
    @Column(length = 1000)
    private String productIds;
    @Column(length = 1000)
    private String quantities;
    private Double totalCost;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private UserEntity user;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProductIds() {
        return productIds;
    }

    public void setProductIds(String productIds) {
        this.productIds = productIds;
    }

    public String getQuantities() {
        return quantities;
    }

    public void setQuantities(String quantities) {
        this.quantities = quantities;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
}
