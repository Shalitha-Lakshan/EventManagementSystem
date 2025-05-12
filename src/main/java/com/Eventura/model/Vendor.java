package com.Eventura.model;

public class Vendor {
	
	private int id;
    private String name;
    private String nic;
    private String email;
    private String phone;
    private String service;
    private String password;
    
	public Vendor(int id, String name, String nic, String email, String phone, String service, String password) {
		super();
		this.id = id;
		this.name = name;
		this.nic = nic;
		this.email = email;
		this.phone = phone;
		this.service = service;
		this.password = password;
		
		
	}
	
	

	public Vendor(String name, String nic, String email, String phone, String service, String password) {
		super();
		this.name = name;
		this.nic = nic;
		this.email = email;
		this.phone = phone;
		this.service = service;
		this.password = password;
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

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
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

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
    
    
}