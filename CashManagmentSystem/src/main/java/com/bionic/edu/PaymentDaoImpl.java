package com.bionic.edu;

import org.springframework.stereotype.Repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Repository
public class PaymentDaoImpl implements PaymentDao{
    @PersistenceContext
    private EntityManager em;
    
    public List<Payment> findAll(){
    	TypedQuery<Payment> query = em.createQuery("SELECT p FROM Payment p", Payment.class);
    	List<Payment> listP = query.getResultList();
    	return listP;
    }
    
    public List<Payment> getSortedBySumPayed(){
    	String txt = "SELECT p FROM Payment p ORDER BY p.SumPayed";
        TypedQuery<Payment> query = em.createQuery(txt, Payment.class);
        return query.getResultList();
    }

	@Override
	public void save(Payment payment){
    	if (payment.getId() == 0){
    		em.persist(payment);
    	} else{
    		em.merge(payment);
    	}
    }

	@Override
	public void remove(int id){
        Payment payment = em.find(Payment.class, id);
	    if (payment != null){
	    	em.remove(payment);
	    }
    }
}
