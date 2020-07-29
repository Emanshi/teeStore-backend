package com.teestore.backend.entity;

import javax.persistence.*;

@Entity
@Table(name = "Card")
public class CardEntity {

    @Id
    private String cardNumber;
    private String cardHolderName;
    private String expiryMonthYear;
    private String cvv;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="user_id")
    private UserEntity user;

    public String getExpiryMonthYear() {
        return expiryMonthYear;
    }

    public void setExpiryMonthYear(String expiryMonthYear) {
        this.expiryMonthYear = expiryMonthYear;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
}
