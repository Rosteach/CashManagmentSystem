package com.bionic.edu;

import java.util.List;

public interface PaymentService {
	public void save(Payment payment);
	public void remove(int id);
	public List<Payment> findAll();
	public List<Payment> getSortedBySumPayed();
}
