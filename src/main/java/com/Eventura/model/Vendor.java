package com.Eventura.model;

public class Vendor {
	
	private int vendorId;
    private String name;
    private String nic;
    private String email;
    private String phone;
    private String service;
    private String password;
    
    
    
	public Vendor(int vendorId, String name, String nic, String email, String phone, String service, String password) {
		super();
		this.vendorId = vendorId;
		this.name = name;
		this.nic = nic;
		this.email = email;
		this.phone = phone;
		this.service = service;
		this.password = password;
		
		
	}
	
	public Vendor() {}

	public Vendor(String name, String nic, String email, String phone, String service, String password) {
		super();
		this.name = name;
		this.nic = nic;
		this.email = email;
		this.phone = phone;
		this.service = service;
		this.password = password;
	}





	public int getVendorId() {
		return vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
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