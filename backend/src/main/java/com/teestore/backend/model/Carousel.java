package com.teestore.backend.model;

import java.time.LocalDate;

public class Carousel {

    private String carouselId;
    private String linkImage;
    private String linkRoute;

    public String getCarouselId() {
        return carouselId;
    }

    public void setCarouselId(String carouselId) {
        this.carouselId = carouselId;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    public String getLinkRoute() {
        return linkRoute;
    }

    public void setLinkRoute(String linkRoute) {
        this.linkRoute = linkRoute;
    }
}
