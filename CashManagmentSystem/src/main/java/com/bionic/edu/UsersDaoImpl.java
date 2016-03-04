package com.bionic.edu;

import java.util.List;
import javax.persistence.TypedQuery;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class UsersDaoImpl implements UsersDao{
    @PersistenceContext
    private EntityManager em;

	@Override
	public void save(Users users) {
		if (users.getId() == 0){
			em.persist(users);
	    } 
	    else{
			em.merge(users);
		}
	}
	@Override
	public String findByEmail(String eMail){
		//Users users;
		String txt ="SELECT u.name FROM ";
		txt +="Users u ";
		txt +="where u.email ='"+eMail+"'";
		TypedQuery<String> query = em.createQuery(txt,String.class);
		//users = (Users)query.getSingleResult();
		return query.getSingleResult();
	}
	@Override
	public List<Users> findAll() {
		TypedQuery<Users> query = em.createQuery("SELECT u FROM Users u",  Users.class);
	    List<Users> listU = query.getResultList();
	    return listU; 
	}
	@Override
	public List<Users> findName() {
		TypedQuery<Users> query = em.createQuery("SELECT u.name FROM Users u",  Users.class);
	    List<Users> listU = query.getResultList();
	    return listU; 
	}
	@Override
	public List<Users> findAllEmail() {
		TypedQuery<Users> query = em.createQuery("SELECT email FROM Users u",  Users.class);
	    List<Users> listU = query.getResultList();
	    return listU; 
	}
}
    