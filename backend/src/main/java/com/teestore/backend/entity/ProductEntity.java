package com.teestore.backend.entity;

import com.teestore.backend.enums.Category;
import com.teestore.backend.enums.Sex;
import com.teestore.backend.enums.Size;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Product")
public class ProductEntity {
    @Id
    private String productId;
    private String productName;
    private Double cost;
    @Enumerated(EnumType.STRING)
    private Size size;
    @Enumerated(EnumType.STRING)
    private Sex sex;
    @Enumerated(EnumType.STRING)
    private Category category;
    private String productGroup;
    private Integer quantity;
    private LocalDateTime dateOfAddition;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Sex getSex() {
        return sex;
    }

    public void setSex(Sex sex) {
        this.sex = sex;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getProductGroup() {
        return productGroup;
    }

    public void setProductGroup(String productGroup) {
        this.productGroup = productGroup;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getDateOfAddition() {
        return dateOfAddition;
    }

    public void setDateOfAddition(LocalDateTime dateOfAddition) {
        this.dateOfAddition = dateOfAddition;
    }
}
