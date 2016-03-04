package com.bionic.edu;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

@Named
public class CustomerServiceImpl implements CustomerService{
    @Inject
    private CustomerDao customerDao;
    
    public Customer findById(int id) { 
    	return customerDao.findById(id); 
	}
    
    @Transactional
	public void save(Customer customer){
		customerDao.save(customer);
	}
   
    @Transactional
    public void remove(int id){
    	customerDao.remove(id);
    }
    
    @Transactional
    public void updateCcNo(int id, String ccNo){
    	customerDao.updateCcNo(id, ccNo);
    }

    public List<String> getNames(double sumPayed){
    	return customerDao.getNames(sumPayed);
    }
    public List<Customer> findAll(){
    	return customerDao.findAll();
    }

	@Override
	public List<Customer> getSortedByID() {
		return customerDao.getSortedByID();
	}

	@Override
	public List<Customer> getSortedByName() {
		return customerDao.getSortedByName();
	}

	@Override
	public List<Customer> getSortedByAddress() {
		return customerDao.getSortedByAddress();
	}
}
