package com.partyos.Repositories;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.partyos.Entities.Event;

public interface EventRepository extends JpaRepository<Event, Long> {

    List<Event> findByUserIdOrderByIdDesc(Long userId);
}