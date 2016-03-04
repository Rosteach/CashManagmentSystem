package com.bionic.edu;

//import java.text.SimpleDateFormat;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Payment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private double chargePayed;//long priority 
	private double sumPayed;
	private String goods;
	private java.sql.Timestamp dt;
	private int customerId;
	private int merchantId;
	
	//constructor
	public Payment() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getChargePayed() {
		return chargePayed;
	}

	public void setChargePayed(double chargePayed) {
		this.chargePayed = chargePayed;
	}

	public double getSumPayed() {
		return sumPayed;
	}

	public void setSumPayed(double sumPayed) {
		this.sumPayed = sumPayed;
	}

	public String getGoods() {
		return goods;
	}

	public void setGoods(String goods) {
		this.goods = goods;
	}

	public java.sql.Timestamp  getDt() {
		return dt;
	}

	public void setDt(java.sql.Timestamp  dt) {
		this.dt = dt;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(int merchantId) {
		this.merchantId = merchantId;
	}
	
	public String getDataForWeb(){
		String ret = "<tr><td>" + id +"<td>" + dt + "<td>" + goods + "<td>" + sumPayed + "<td>"+ customerId +"<td>" +merchantId+"</tr>";
		return ret;
	}

	/*public String toString(){
		String txt = "id = " + id + ";   date = ";
		SimpleDateFormat dtFrm = new SimpleDateFormat("dd.MM.yyyy HH:mm"); 
    	txt += dtFrm.format(dt) + ";   merchant = " + merchantId;
	    txt += ";   sumPayed = " + sumPayed + ";    chargePayed = " + chargePayed;
	    return txt;
	}*/
}
