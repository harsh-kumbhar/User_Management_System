package net.usermanagement.model;

public class User {
    private int sr_no;
    private String name;
    private String email;
    private String country;
    private String state;
    private String city;
    private String gender;
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

    // Constructor for creating a new user
    public User(String name, String email, String country,String state, String city, String gender) {
        this.name = name;
        this.email = email;
        this.country = country;
        this.state = state;
        this.city = city;
        this.gender = gender;
        
    }

	// Constructor for updating an existing user
    public User(int sr_no, String name, String email, String country,String state, String city, String gender) {
        this.sr_no = sr_no;
        this.name = name;
        this.email = email;
        this.country = country;
        this.state = state;
        this.city = city;
        this.gender = gender;

    }

    // Getters and setters
    public int getSr_no() {
        return sr_no;
    }

    public void setSr_no(int sr_no) {
        this.sr_no = sr_no;
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

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}
