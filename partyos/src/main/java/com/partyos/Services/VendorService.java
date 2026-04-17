package com.partyos.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partyos.Entities.User;
import com.partyos.Entities.Vendor_Service;
import com.partyos.Enums.ServiceType;
import com.partyos.Repositories.UserRepository;
import com.partyos.Repositories.Vendor_ServicesRepositories;

@Service
public class VendorService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private Vendor_ServicesRepositories vendorsServicesRepository;
    
// IMPORTANT: When adding a service, we must ensure the user is an approved vendor.
//    This is crucial to maintain data integrity and ensure only authorized users can add services.
    public void addService(User user, Vendor_Service vendor) {
		// Ensure user is a vendor and approved
		User existingUser = userRepository.findById(user.getId()).orElseThrow();
		if (!"vendor".equals(existingUser.getRole()) || !"APPROVED".equals(existingUser.getStatus())) {
			throw new IllegalStateException("User must be an approved vendor to add services.");
		}

		// Set the user for the service and save
		vendor.setUser(existingUser);
		vendor.setStatus("PENDING"); // IMPORTANT
		vendorsServicesRepository.save(vendor);
	}
    public Vendor_Service getServiceById(Long id) {
        return vendorsServicesRepository.findById(id).orElseThrow();
    }

    // 🔥 Only update fields that are provided (non-null) to avoid overwriting existing data with nulls 
    public void updateService(Vendor_Service updatedService) {

        Vendor_Service existing = vendorsServicesRepository
                .findById(updatedService.getId())
                .orElseThrow();

        existing.setBusinessName(updatedService.getBusinessName());
        existing.setServiceType(updatedService.getServiceType());
        existing.setCity(updatedService.getCity());
        existing.setMinPrice(updatedService.getMinPrice());
        existing.setMaxPrice(updatedService.getMaxPrice());
        existing.setDescription(updatedService.getDescription());
        existing.setContactInfo(updatedService.getContactInfo());
        existing.setInstagram(updatedService.getInstagram());
        existing.setFacebook(updatedService.getFacebook());
        existing.setWebsite(updatedService.getWebsite());

        //  only update image if new provided
        if (updatedService.getImageUrl() != null) {
            existing.setImageUrl(updatedService.getImageUrl());
        }

        vendorsServicesRepository.save(existing);
    }

    public void deleteService(Long id) {
        vendorsServicesRepository.deleteById(id);
    }
    public List<Vendor_Service> getVendorServices(Long userId) {
        return vendorsServicesRepository.findByUserId(userId);
    }
    //   Filter services by type and city, only return approved ones 
    public List<Vendor_Service> getFilteredServices(String type, String city) {

        try {
            ServiceType serviceType = ServiceType.valueOf(type.toUpperCase());

            return vendorsServicesRepository
                    .findByServiceTypeAndCityAndStatus(
                            serviceType,
                            city.trim(),
                            "APPROVED"
                    );

        } catch (Exception e) {
            return List.of();
        }
    }
    public List<Vendor_Service> getAllApprovedServices() {
        return vendorsServicesRepository.findByStatus("APPROVED");
    }
}