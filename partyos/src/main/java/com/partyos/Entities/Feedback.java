package com.partyos.Entities;

 

import jakarta.persistence.*;

@Entity
@Table(name = "feedbacks")
public class Feedback {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int rating; // 1 to 5

    private String comment;

    // 🔗 Which user gave feedback
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    // 🔗 Which service
    @ManyToOne
    @JoinColumn(name = "service_id")
    private Vendor_Service service;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

    // getters & setters
}