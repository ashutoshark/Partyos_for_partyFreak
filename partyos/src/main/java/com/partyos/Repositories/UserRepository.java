package com.partyos.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partyos.Entities.User;

public interface UserRepository extends  JpaRepository<User, Long> {

	User findByUsername(String username);
	// Custom query methods can be defined here if needed
	
	List<User> findByRoleAndStatus(String role, String status);

	long countByRole(String string);
	List<User> findByRole(String role);
	 

	// 🔍 Search
	List<User> findByUsernameContainingIgnoreCaseOrEmailContainingIgnoreCase(String username, String email);
//find all vendors
	 

}
