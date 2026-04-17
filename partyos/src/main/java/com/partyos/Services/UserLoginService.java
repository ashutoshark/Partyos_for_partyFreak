package com.partyos.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partyos.Entities.User;
import com.partyos.Repositories.UserRepository;

@Service
public class UserLoginService {
	
	@Autowired
	private UserRepository userRepository;
	
	public User registerUser(User user) {

	    //  DO NOT override role
	    if ("vendor".equals(user.getRole())) {
	        user.setStatus("PENDING");   // vendor needs admin approval
	    } else {
	        user.setStatus("APPROVED");  // normal user
	    }

	    return userRepository.save(user);
	}
	//role based authentication
	public User authenticate(String username, String password) {
		User user = userRepository.findByUsername(username);
		if (user != null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}
}
