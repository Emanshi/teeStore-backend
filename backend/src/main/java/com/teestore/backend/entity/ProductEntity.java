package com.teestore.backend.entity;

import com.teestore.backend.enums.Category;
import com.teestore.backend.enums.Sex;
import com.teestore.backend.enums.Size;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Product")
@TypeDef(
        name = "pgsql_enum",
        typeClass = PostgreSQLEnumType.class
)
public class ProductEntity {
    @Id
    private String productId;
    private String productName;
    private Double cost;
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "size_type")
    @Type(type = "pgsql_enum")
    private Size size;
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "sex_type")
    @Type(type = "pgsql_enum")
    private Sex sex;
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "category_type")
    @Type(type = "pgsql_enum")
    private Category category;
    private String productGroup;
    private Integer quantity;
    private LocalDateTime dateOfAddition;
    private String productInfo;
    private Double discount;
    private String avgRating;

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

    public String getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(String productInfo) {
        this.productInfo = productInfo;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public String getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(String avgRating) {
        this.avgRating = avgRating;
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
