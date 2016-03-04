package com.bionic.edu;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Users {
	@Id
 	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String email;
	private String login;
	private String password;
	private String regDate;
	

	public Users() { }

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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getDataForWeb(){
		String ret = "<tr><td>" +name +"<td>"+ email +"<td>" + login + "<td>" + password + "<td>" + regDate+ "</tr>";
		return ret;
	}
	public String getEmailForWeb(){
		String ret = "<tr><td>" + email + "</tr>";
		return ret;
	}
	public String getNameForWeb(){
		String ret = "<tr><td>" + name + "</tr>";
		return ret;
	}
	
}
