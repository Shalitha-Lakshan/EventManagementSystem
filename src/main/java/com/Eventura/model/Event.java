package com.Eventura.model;

public class Event {

    private int eventId;
    private String full_name;
    private String email;
    private String phone;
    private String event_date;
    private String event_title;
    private String event_type;
    private String venue;
    private double budget;
    private int guest_count;
    private String requirements;
    private int vendorId;
    
    public Event() {
    
    }

    // Constructor
    public Event(int eventId, String full_name, String email, String phone, String event_date,
                 String event_title, String event_type, String venue,
                 double budget, int guest_count, String requirements,int vendorId) {
        this.eventId = eventId;
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.event_date = event_date;
        this.event_title = event_title;
        this.event_type = event_type;
        this.venue = venue;
        this.budget = budget;
        this.guest_count = guest_count;
        this.requirements = requirements;
        this.vendorId = vendorId;
    }

    // Overloaded constructor without ID (for insert operations)
    public Event(String full_name, String email, String phone, String event_date,
                 String event_title, String event_type, String venue,
                 double budget, int guest_count, String requirements) {
        this.full_name = full_name;
        this.email = email;
        this.phone = phone;
        this.event_date = event_date;
        this.event_title = event_title;
        this.event_type = event_type;
        this.venue = venue;
        this.budget = budget;
        this.guest_count = guest_count;
        this.requirements = requirements;
    }

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
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

	public String getEvent_date() {
		return event_date;
	}

	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	

	public String getEvent_type() {
		return event_type;
	}

	public void setEvent_type(String event_type) {
		this.event_type = event_type;
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

	

	public int getGuest_count() {
		return guest_count;
	}

	public void setGuest_count(int guest_count) {
		this.guest_count = guest_count;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public int getVendorId() {
		return vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}
    
   
    // Getters and Setters
  
    
}
