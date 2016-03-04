package com.bionic.edu;

import java.util.List;

public interface UsersDao {
	public void save(Users users);
	public String findByEmail(String eMail);
	public List<Users> findAll();
	public List<Users> findName();
	public List<Users> findAllEmail();
}
