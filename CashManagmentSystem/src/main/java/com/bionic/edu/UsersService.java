package com.bionic.edu;

import java.util.List;

public interface UsersService {
	public void save(Users users);
	public String findByEmail(String name);
	public List<Users> findAll();
	public List<Users> findName();
	public List<Users> findAllEmail();
}
