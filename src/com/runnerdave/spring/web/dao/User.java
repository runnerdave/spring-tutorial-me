package com.runnerdave.spring.web.dao;

public class User {
	private String name;
	private String password;
	private String email;
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private boolean enabled = false;
	private String authority;

	public String getName() {
		return name;
	}

	public void setName(String username) {
		this.name = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public User(String name, String password, String email, boolean enabled, String authority) {
		this.name = name;
		this.password = password;
		this.enabled = enabled;
		this.authority = authority;
	}

	public User() {
	}

}
