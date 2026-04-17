package com.partyos.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partyos.Entities.Vendor_Service;
import com.partyos.Enums.ServiceType;

 

public interface Vendor_ServicesRepositories extends JpaRepository<Vendor_Service, Long> {
	List<Vendor_Service> findByUserId(Long Id);
	List<Vendor_Service> findByStatus(String status);
	// ✅ CORRECT (Enum type)
	List<Vendor_Service> findByServiceTypeAndCityAndStatus(
	    ServiceType serviceType, String city, String status);
	
}
