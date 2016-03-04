package com.bionic.edu;

import java.util.List;
import javax.persistence.TypedQuery;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class CustomerDaoImpl implements CustomerDao{
    @PersistenceContext
    private EntityManager em;

    public Customer findById(int id){
    	Customer customer = null;
    	customer = em.find(Customer.class, id);
    	return customer;
    }
    
    public void save(Customer customer){
    	if (customer.getId() == 0){
		em.persist(customer);
    	} 
    	else{
		em.merge(customer);
		}
    }
    
    public void remove(int id){
        Customer customer = em.find(Customer.class, id);
	    if (customer != null){
	    	em.remove(customer);
	    }
    }

    public void updateCcNo(int id, String ccNo){
    	Customer customer = em.find(Customer.class, id);
    	if (customer != null){
    		customer.setCcNo(ccNo);
    	}
    }

    public List<Customer> findAll(){
        TypedQuery<Customer> query = em.createQuery("SELECT c FROM Customer c",  Customer.class);
        List<Customer> listM = query.getResultList();
        return listM; 
    }
    
    public List<String> getNames(double sumPayed){
    	String txt = "SELECT DISTINCT c.name FROM Payment p, Customer c WHERE c.id = p.customerId AND p.sumPayed > :limit";
    	TypedQuery<String> query = em.createQuery(txt, String.class);
    	query.setParameter("limit", sumPayed);
     	return query.getResultList();
    }

	@Override
	public List<Customer> getSortedByID() {
		String txt = "SELECT c FROM Customer c ORDER BY c.id";
        TypedQuery<Customer> query = em.createQuery(txt, Customer.class);
        return query.getResultList();
	}
	@Override
	public List<Customer> getSortedByName() {
		String txt = "SELECT c FROM Customer c ORDER BY c.name";
        TypedQuery<Customer> query = em.createQuery(txt, Customer.class);
        return query.getResultList();
	}
	@Override
	public List<Customer> getSortedByAddress() {
		String txt = "SELECT c FROM Customer c ORDER BY c.address";
        TypedQuery<Customer> query = em.createQuery(txt, Customer.class);
        return query.getResultList();
	}
}
