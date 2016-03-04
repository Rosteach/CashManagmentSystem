package com.bionic.edu;

import java.util.List;

public interface PaymentDao {
	public void save(Payment merchant);
	
	public void remove(int id);
	
	public List<Payment> findAll();
	
	public List<Payment> getSortedBySumPayed();
	
}
