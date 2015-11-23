package com.runnerdave.spring.web.dao;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.runnerdave.spring.web.validation.ValidEmail;

public class Offer {
	private int id;
	
	@Size(min=5, max=100, message="Name must be between 5 and 10")
	private String name;
	
	@NotNull	
	//@Pattern(regexp=".*\\@.*\\..*", message="This does not appear to be a valid email")
	@ValidEmail(min=6, message="This email address is not valid.")
	private String email;
	
	@Size(min=5, max=100, message="Name must be between 20 and 255")
	private String text;

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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "Offer [id=" + id + ", name=" + name + ", email=" + email
				+ ", text=" + text + "]";
	}

}
