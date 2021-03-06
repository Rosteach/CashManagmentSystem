package com.bionic.edu;

import java.util.List;

public interface CustomerService {
	public Customer findById(int id);
	public void save(Customer customer);
	public void remove(int id);
	public void updateCcNo(int id, String ccNo);
	public List<Customer> getSortedByID();
	public List<Customer> getSortedByName();
	public List<Customer> getSortedByAddress();
	public List<Customer> findAll();
	public List<String> getNames(double sumPayed);
}
