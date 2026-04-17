package com.partyos.Entities;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime bookingTime;

    private String status; // CONFIRMED, CANCELLED

    @ManyToOne
    private User user;

    @ManyToOne
    private Vendor_Service service;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDateTime getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(LocalDateTime bookingTime) {
		this.bookingTime = bookingTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Vendor_Service getService() {
		return service;
	}

	public void setService(Vendor_Service service) {
		this.service = service;
	}

    // getters setters
}