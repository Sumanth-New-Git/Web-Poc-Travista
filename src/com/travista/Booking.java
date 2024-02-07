package com.travista;

import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private String placeName;
    private String activities;
    private String accommodation;
    private Timestamp bookingDate;

    public Booking(int bookingId, String placeName, String activities, String accommodation, Timestamp bookingDate) {
        this.bookingId = bookingId;
        this.placeName = placeName;
        this.activities = activities;
        this.accommodation = accommodation;
        this.bookingDate = bookingDate;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getActivities() {
        return activities;
    }

    public void setActivities(String activities) {
        this.activities = activities;
    }

    public String getAccommodation() {
        return accommodation;
    }

    public void setAccommodation(String accommodation) {
        this.accommodation = accommodation;
    }

    public Timestamp getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }
}
