package com.bionic.edu;

import javax.persistence.*;

@Entity
public class Customer {
	@Id
 	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private java.sql.Date maturity;
	private String ccType;
	private String ccNo;
	private String eMail;
	private String address;
	private String name;

	public Customer() {  }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public java.sql.Date getMaturity() {
		return maturity;
	}

	public void setMaturity(java.sql.Date maturity) {
		this.maturity = maturity;
	}

	public String getCcType() {
		return ccType;
	}

	public void setCcType(String ccType) {
		this.ccType = ccType;
	}

	public String getCcNo() {
		return ccNo;
	}

	public void setCcNo(String ccNo) {
		this.ccNo = ccNo;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDataForWeb(){ 
		String ret = "<tr><td>" +id +"<td>"+ name +"<td>" + address + "<td>" + eMail + "<td>" + ccNo + "<td>" +ccType+ "</tr>";
		return ret;
	}
	
	public String toString () {
		 String txt = "id = " + id + ";   name = ' " + name + "';   address = ";
	     txt += "" + address + ";   eMail = " + eMail + " ccType = " + ccType; 	
	     return txt;
	}

}
