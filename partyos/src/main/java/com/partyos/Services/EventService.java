package com.partyos.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.partyos.Entities.Event;
import com.partyos.Entities.User;
import com.partyos.Repositories.EventRepository;

import java.util.List;

@Service
public class EventService {

    @Autowired
    private EventRepository repo;

    // Save an event by associating it with a user and a summary, then persist it using the repository and return the saved event object 
    public Event saveEvent(Event event, User user, String summary) {
        event.setUser(user);
        event.setPlanSummary(summary);
        return repo.save(event);
    }

    public List<Event> getUserEvents(Long userId) {
        return repo.findByUserIdOrderByIdDesc(userId);
    }
}
