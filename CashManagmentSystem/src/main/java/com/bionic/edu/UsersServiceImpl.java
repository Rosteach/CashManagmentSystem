package com.bionic.edu;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

@Named
public class UsersServiceImpl implements UsersService{
	@Inject
	private UsersDao usersDao;
	    
	@Transactional
	public void save(Users users){
		usersDao.save(users);
	}
	public List<Users> findAll() {
		return usersDao.findAll();
	}
	public List<Users> findName() {
		return usersDao.findName();
	}
	public List<Users> findAllEmail() {
		return usersDao.findAllEmail();
	}
	@Override
	 public String findByEmail(String eMail) { 
    	return usersDao.findByEmail(eMail); 
    }
	@Override
	public String findPass(String eMail) {
		return usersDao.findPass(eMail);
	}
}
