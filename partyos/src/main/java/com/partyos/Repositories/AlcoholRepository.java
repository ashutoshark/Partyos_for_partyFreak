package com.partyos.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.partyos.Entities.Alcohol;
import com.partyos.Enums.AlcoholCategory;
import com.partyos.Enums.City;

public interface AlcoholRepository extends JpaRepository<Alcohol, Long> {

    List<Alcohol> findByCategoryAndCity(AlcoholCategory category, String city);
    List<Alcohol> findByVendorServiceUserId(Long userId);

     
    List<Alcohol> findByCategoryAndCityAndVendorServiceStatus(
            AlcoholCategory category,
            City city,
            String status);
    List<Alcohol> findByVendorServiceId(Long vendorId);

 
    @Query("""
    		SELECT a FROM Alcohol a 
    		JOIN a.vendorService v 
    		WHERE a.category = :category 
    		AND a.city = :city 
    		AND v.status = 'APPROVED'
    		""")
    		List<Alcohol> findFilteredAlcohol(
    		        @Param("category") AlcoholCategory category,
    		        @Param("city") City city);
	 
}
