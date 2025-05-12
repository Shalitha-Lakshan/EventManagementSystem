package com.Eventura.model;

public class Assignment {
    private int id;
    private int eventId;
    private int vendorId;
    private String status;

    public Assignment(int id, int eventId, int vendorId, String status) {
        this.id = id;
        this.eventId = eventId;
        this.vendorId = vendorId;
        this.status = status;
    }

    public Assignment(int eventId, int vendorId) {
        this.eventId = eventId;
        this.vendorId = vendorId;
        this.status = "Pending";
    }

    // Getters and setters
    public int getId() { return id; }
    public int getEventId() { return eventId; }
    public int getVendorId() { return vendorId; }
    public String getStatus() { return status; }

    public void setId(int id) { this.id = id; }
    public void setEventId(int eventId) { this.eventId = eventId; }
    public void setVendorId(int vendorId) { this.vendorId = vendorId; }
    public void setStatus(String status) { this.status = status; }
}
