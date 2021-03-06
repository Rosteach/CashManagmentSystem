package com.bionic.edu;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

@Named
public class MerchantServiceImpl implements MerchantService{
    @Inject
    private MerchantDao merchantDao;
    
    public Merchant findById(int id) { 
    	return merchantDao.findById(id); 
    }
    
    @Transactional
    public void save(Merchant merchant){
    	merchantDao.save(merchant);
    }
    
    @Transactional
    public void remove(int id){
    	merchantDao.remove(id);
    }
    
    @Transactional
    public void updateAccount(int id, String newAccount){
    	merchantDao.updateAccount(id, newAccount);
    }
    
    public List<Merchant> findAll(){
    	return merchantDao.findAll();
    }

    public List<Merchant> getSortedByNeedToPay(){
    	return merchantDao.getSortedByNeedToPay();
    }

	@Override
	public List<Merchant> getSortedByID() {	
		return merchantDao.getSortedByID();
	}

	@Override
	public List<Merchant> getSortedByName() {
		// TODO Auto-generated method stub
		return merchantDao.getSortedByName();
	}

	@Override
	public List<Merchant> getSortedByMinSum() {
		// TODO Auto-generated method stub
		return merchantDao.getSortedByMinSum();
	}

	@Transactional
	public void updateSent(int id, double newSent) {
		// TODO Auto-generated method stub
		merchantDao.updateSent(id, newSent);
	}

	@Override
	public List<Result> generatePayList(java.sql.Timestamp  dateF, java.sql.Timestamp  dateS) {
		// TODO Auto-generated method stub
		return merchantDao.generatePayList(dateF, dateS);
	}

	@Transactional
	public void updateLastSent(int id) {
		// TODO Auto-generated method stub
		merchantDao.updateLastSent(id);
	}
}

