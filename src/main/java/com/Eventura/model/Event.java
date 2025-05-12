package com.Eventura.model;

public class Event {

    private int id;
    private String fullName;
    private String email;
    private String phone;
    private String eventDate;
    private String eventTitle;
    private String eventType;
    private String venue;
    private double budget;
    private int guestCount;
    private String requirements;

    // Constructor
    public Event(int id, String fullName, String email, String phone, String eventDate,
                 String eventTitle, String eventType, String venue,
                 double budget, int guestCount, String requirements) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.eventDate = eventDate;
        this.eventTitle = eventTitle;
        this.eventType = eventType;
        this.venue = venue;
        this.budget = budget;
        this.guestCount = guestCount;
        this.requirements = requirements;
    }

    // Overloaded constructor without ID (for insert operations)
    public Event(String fullName, String email, String phone, String eventDate,
                 String eventTitle, String eventType, String venue,
                 double budget, int guestCount, String requirements) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.eventDate = eventDate;
        this.eventTitle = eventTitle;
        this.eventType = eventType;
        this.venue = venue;
        this.budget = budget;
        this.guestCount = guestCount;
        this.requirements = requirements;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getEventTitle() {
        return eventTitle;
    }

    public void setEventTitle(String eventTitle) {
        this.eventTitle = eventTitle;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    public int getGuestCount() {
        return guestCount;
    }

    public void setGuestCount(int guestCount) {
        this.guestCount = guestCount;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }
}
