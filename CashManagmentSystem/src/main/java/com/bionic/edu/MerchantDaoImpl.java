package com.bionic.edu;

import org.springframework.stereotype.Repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Repository
public class MerchantDaoImpl implements MerchantDao {
    @PersistenceContext
    private EntityManager em;
    
    public Merchant findById(int id){
    	return em.find(Merchant.class, id);
    }

    public void save(Merchant merchant){
    	if (merchant.getId() == 0){
    		em.persist(merchant);
    	} else{
    		em.merge(merchant);
    	}
    }
    
    public void remove(int id){
    	Merchant merchant = em.find(Merchant.class, id);
    	if (merchant != null){
    		em.remove(merchant);
    	}
    }
    
    public void updateAccount(int id, String newAccount){
    	Merchant merchant = em.find(Merchant.class, id);
    	if (merchant != null){
    		merchant.setAccount(newAccount);
    	}
    }
    
    public void updateSent(int id, double newSent){
		Merchant merchant = em.find(Merchant.class, id);
		if (merchant != null){	
			merchant.setSent(newSent);
		}	
    }
    
    @Override
	public void updateLastSent(int id) {
    	Merchant merchant = em.find(Merchant.class, id);
		if (merchant != null){
			java.util.Date utilDate = new java.util.Date();
		    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			//SimpleDateFormat sf = new SimpleDateFormat("dd.MM.yyyy");
			merchant.setLastSent(sqlDate);
			
		}	
		
	}
    
    
    public List<Merchant> findAll(){
        TypedQuery<Merchant> query = em.createQuery("SELECT m FROM Merchant m",  Merchant.class);
        List<Merchant> listM = query.getResultList();
        return listM; 
    }

    public List<Merchant> getSortedByNeedToPay(){
        String txt = "SELECT m FROM Merchant m ORDER BY m.needToSend";
        TypedQuery<Merchant> query = em.createQuery(txt, Merchant.class);
        return query.getResultList();
    }

	@Override
	public List<Merchant> getSortedByID() {
		String txt = "SELECT m FROM Merchant m ORDER BY m.id";
        TypedQuery<Merchant> query = em.createQuery(txt, Merchant.class);
        return query.getResultList();
	}

	@Override
	public List<Merchant> getSortedByName() {
		String txt = "SELECT m FROM Merchant m ORDER BY m.name";
        TypedQuery<Merchant> query = em.createQuery(txt, Merchant.class);
        return query.getResultList();
	}

	@Override
	public List<Merchant> getSortedByMinSum() {
		String txt = "SELECT m FROM Merchant m ORDER BY m.minSum";
        TypedQuery<Merchant> query = em.createQuery(txt, Merchant.class);
        return query.getResultList();
	}

	@Override
	public List<Result> generatePayList(java.sql.Timestamp  dateF, java.sql.Timestamp  dateS) {
		 String txt = "SELECT new com.bionic.edu.Result(p.merchantId, m.name, m.minSum, SUM(p.sumPayed), m.needToSend)";
	     txt += "FROM Payment p, Merchant m WHERE m.id = p.merchantId AND p.dt>='"+dateF+"' AND p.dt<='"+dateS+"' GROUP BY p.merchantId, m.name, m.minSum, m.needToSend"; 
	     TypedQuery<Result> query = em.createQuery(txt, Result.class);
	     return query.getResultList();
	}
}
