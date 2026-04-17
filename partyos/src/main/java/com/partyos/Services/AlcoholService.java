package com.partyos.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partyos.Entities.Alcohol;
import com.partyos.Enums.AlcoholCategory;
import com.partyos.Enums.City;
import com.partyos.Repositories.AlcoholRepository;

@Service
public class AlcoholService {

    @Autowired
    private AlcoholRepository repo;

    // Get all alcohol items 
    public List<Alcohol> getByCategory(String category, String city) {

        AlcoholCategory cat = AlcoholCategory.valueOf(category.toUpperCase());

        return repo.findByCategoryAndCity(cat, city);
    }
    
    // Get filtered alcohol items based on category and city and limit to 6 items
    public List<Alcohol> getFilteredAlcohol(String category, String city) {

        System.out.println("Category: " + category);
        System.out.println("City: " + city);

        AlcoholCategory cat = AlcoholCategory.valueOf(category.toUpperCase());
        City cityEnum = City.valueOf(city.toUpperCase());

        List<Alcohol> list = repo.findFilteredAlcohol(cat, cityEnum);

        System.out.println("Fetched items: " + list.size());

        return repo.findFilteredAlcohol(cat, cityEnum)
                .stream()
                .limit(6)
                .toList();
    }

	 
}
