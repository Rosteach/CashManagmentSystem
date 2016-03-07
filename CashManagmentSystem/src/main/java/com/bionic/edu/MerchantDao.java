package com.bionic.edu;

import java.util.List;

public interface MerchantDao {
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
	List<Result> generatePayList(java.sql.Timestamp  dateF, java.sql.Timestamp  dateS);
}
