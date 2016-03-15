package com.bionic.edu;

public class Result {
	private int merchantId; // from Merchant
	private String name; // from Merchant
	private double minSum; // from Merchant
	private double sum; // from Payments
	private double needToSend; // from Merchant

	public Result(){   }
	
	public Result(int merchantId, String name, double minSum, double sum, double needToSend){
		this.merchantId = merchantId;
		this.name = name;
		this.minSum = minSum;
		this.sum = sum;
		this.needToSend = needToSend;
	}
	
	public int getId() {
		return merchantId;
	}

	public void setId(int merchantId) {
		this.merchantId = merchantId;
	}

	public double getMinSum() {
		return minSum;
	}

	public void setMinSum(double minSum) {
		this.minSum = minSum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getSum() {
		return sum;
	}

	public void setSum(double sum) {
		this.sum = sum;
	}

	public double getNeedToSend() {
		return needToSend;
	}

	public void setNeedToSend(double needToSend) {
		this.needToSend = needToSend;
	}
	public String getDataForWeb(){ 
		String ret = "<tr><td>"+merchantId+"<td>"+ name +"<td>" +minSum+"<td id=>"+sum+"<td>"+needToSend+"</tr>";
		return ret;
	}
}