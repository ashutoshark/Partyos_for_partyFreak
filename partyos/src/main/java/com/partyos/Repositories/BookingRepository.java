package com.partyos.Repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.partyos.Entities.Booking;

public interface BookingRepository extends JpaRepository<Booking, Long> {

    List<Booking> findByUserId(Long userId);
}