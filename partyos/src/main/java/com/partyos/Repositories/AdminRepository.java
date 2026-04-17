package com.partyos.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partyos.Entities.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
	Admin findByUsername(String username);
	
}
