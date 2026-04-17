package com.partyos.Services;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partyos.Entities.Booking;
import com.partyos.Entities.User;
import com.partyos.Entities.Vendor_Service;
import com.partyos.Repositories.BookingRepository;

@Service
public class BookingService {

	@Autowired
	private BookingRepository bookingRepository;

	// Create single booking
	public void createBooking(User user, Vendor_Service service) {

		Booking booking = new Booking();

		booking.setUser(user);
		booking.setService(service);
		booking.setBookingTime(LocalDateTime.now());
		booking.setStatus("CONFIRMED");

		bookingRepository.save(booking);
	}

	//Bulk booking (IMPORTANT) - This method can be used to create multiple bookings at once,
//	for example when a user selects multiple services and checks out.
//	It iterates through the list of services and creates a booking for each one using the createBooking method.
	public void checkout(User user, List<Vendor_Service> services) {

		for (Vendor_Service service : services) {
			createBooking(user, service);
		}
	}
// Get all bookings for a specific user 
	public List<Booking> getUserBookings(Long userId) {
		return bookingRepository.findByUserId(userId);
	}
}