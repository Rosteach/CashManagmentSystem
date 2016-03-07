package com.bionic.edu;

import java.sql.Timestamp;
import java.util.List;

public interface MerchantService {
	public Merchant findById(int id);
	public void save(Merchant merchant);
	public void remove(int id);
	public void updateAccount(int id, String newAccount);
	public void updateSent(int id, double newSent);
	public void updateLastSent(int id);
	public List<Merchant> findAll();
	public List<Merchant> getSortedByNeedToPay();
	public List<Merchant> getSortedByID();
	public List<Merchant> getSortedByName();
	public List<Merchant> getSortedByMinSum();
	public List<Result> generatePayList(Timestamp dateF, Timestamp dateS);
	
}
