package com.Eventura.model;


public class insert {
	private int id;
	private String name;
	private String catagory;
	private String qunetity;
	private String description;
	
	public insert(int id, String name, String catagory, String qunetity, String description) {
		super();
		this.id = id;
		this.name = name;
		this.catagory = catagory;
		this.qunetity = qunetity;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCatagory() {
		return catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	public String getQunetity() {
		return qunetity;
	}

	public void setQunetity(String qunetity) {
		this.qunetity = qunetity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
