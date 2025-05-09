package com.Eventura.model;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String profilePic;
    private String role;

    public User() {}

   
    public User(String name, String email, String password, String profilePic, String role) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.profilePic = profilePic;
        this.role = role;
    }

    
    public User(int id, String name, String email, String password, String profilePic, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.profilePic = profilePic;
        this.role = role;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
