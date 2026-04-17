package com.partyos.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partyos.Entities.Admin;
import com.partyos.Repositories.AdminRepository;

@Service
public class AdminAuthService {

    @Autowired
    private AdminRepository adminRepository;

    public Admin register(Admin admin) {
        return adminRepository.save(admin);
    }
    public Admin login(String username, String password) {

        Admin admin = adminRepository.findByUsername(username);

        if (admin != null && admin.getPassword().equals(password)) {
            return admin;
        }

        return null;
    }
}