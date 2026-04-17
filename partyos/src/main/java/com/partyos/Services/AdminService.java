package com.partyos.Services;

 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partyos.Entities.Booking;
import com.partyos.Entities.User;
import com.partyos.Entities.Vendor_Service;
import com.partyos.Repositories.BookingRepository;
import com.partyos.Repositories.UserRepository;
import com.partyos.Repositories.Vendor_ServicesRepositories;

@Service
public class AdminService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private Vendor_ServicesRepositories vendorsServicesRepository;
    
    @Autowired
    private BookingRepository bookingRepository;
    
    public List<User> getPendingVendors() {
        return userRepository.findByRoleAndStatus("vendor", "PENDING");
    }

    // Approve Vendor by ID and update status to APPROVED
    public void approveVendor(Long id) {
        User user = userRepository.findById(id).orElseThrow();
        user.setStatus("APPROVED");
        userRepository.save(user);
    }
    
    public List<Vendor_Service> getPendingServices() {
        return vendorsServicesRepository.findByStatus("PENDING");
    }

    // Approve Service by ID and update status to APPROVED
    public void approveService(Long id) {
    	Vendor_Service service = vendorsServicesRepository.findById(id).orElseThrow();
        service.setStatus("APPROVED");
        vendorsServicesRepository.save(service);
    }

    // Reject Service by ID and update status to REJECTED
    public void rejectService(Long id) {
    	Vendor_Service service = vendorsServicesRepository.findById(id).orElseThrow();
        service.setStatus("REJECTED");
        vendorsServicesRepository.save(service);
    }
    
    public long getTotalUsers() {
        return userRepository.count();
    }

    public long getTotalVendors() {
        return userRepository.countByRole("vendor");
    }

    //  Pending Vendors Count - Count users with role "vendor" and status "PENDING"
    public long getPendingVendorsCount() {
        return userRepository.findByRoleAndStatus("vendor", "PENDING").size();
    }

    public long getPendingServicesCount() {
        return vendorsServicesRepository.findByStatus("PENDING").size();
    }

    public long getTotalBookings() {
        return bookingRepository.count();
    }

    public List<Booking> getRecentBookings() {
        return bookingRepository.findAll(); // later optimize
    }
    public List<User> getAllUsers() {
        return userRepository.findByRole("user");
    }

    public List<User> getAllVendors() {
        return userRepository.findByRole("vendor");
    }
    
     

    public void rejectVendor(Long id) {
        User user = userRepository.findById(id).orElseThrow();
        user.setStatus("REJECTED");
        userRepository.save(user);
    }
    
 //  Approved Vendors
    public List<User> getApprovedVendors() {
        return userRepository.findByRoleAndStatus("vendor", "APPROVED");
    }

    // Search Vendors
    public List<User> searchVendors(String keyword) {
        return userRepository.findByUsernameContainingIgnoreCaseOrEmailContainingIgnoreCase(keyword, keyword);
    }
}
