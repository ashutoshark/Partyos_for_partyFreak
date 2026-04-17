package com.partyos.Entities;

import com.partyos.Enums.AlcoholCategory;
import com.partyos.Enums.City;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Alcohol {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String brandName; // Johnnie Walker
    private String name;      // Black Label

    @Enumerated(EnumType.STRING)
    private AlcoholCategory category;

    private double price;

    private String shopName;
    @Enumerated(EnumType.STRING)
    private City city;
    private String contact;

    private String imageUrl;
    
     

        public String getDisplayImage() {

            if (imageUrl != null && !imageUrl.isEmpty()) {
                return imageUrl;
            }

            switch (category) {
                case BEER:
                    return "https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400";

                case WHISKEY:
                    return "https://images.unsplash.com/photo-1584225064785-c62a8b43d148?w=400";

                case VODKA:
                    return "https://images.unsplash.com/photo-1582571352032-448f792d4c5f?w=400";

                case RUM:
                    return "https://images.unsplash.com/photo-1608889175123-8ee362201f81?w=400";

                case WINE:
                    return "https://images.unsplash.com/photo-1510626176961-4b57d4fbad03?w=400";

                default:
                    return "https://via.placeholder.com/300x200?text=Alcohol";
            }
        
    }
    
    @ManyToOne
    @JoinColumn(name = "vendor_id")
    private Vendor_Service vendorService;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AlcoholCategory getCategory() {
		return category;
	}

	public void setCategory(AlcoholCategory category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	 public City getCity() {
		return city;
	}
	
	 public void setCity(City city) {
		this.city = city;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Vendor_Service getVendorService() {
		return vendorService;
	}

	public void setVendorService(Vendor_Service vendorService) {
		this.vendorService = vendorService;
	}

	 

    // getters setters
}