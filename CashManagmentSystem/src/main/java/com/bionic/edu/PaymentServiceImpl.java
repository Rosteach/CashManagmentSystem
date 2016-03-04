package com.bionic.edu;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

@Named
public class PaymentServiceImpl implements PaymentService{
    @Inject
    private PaymentDao paymentDao;
  
    @Transactional
    public void save(Payment merchant){
    	paymentDao.save(merchant);
    }
    @Transactional
    public void remove(int id){
    	paymentDao.remove(id);
    }
    
    public List<Payment> findAll(){
    	return paymentDao.findAll();
    }

    public List<Payment> getSortedBySumPayed(){
    	return paymentDao.getSortedBySumPayed();
    }
}
