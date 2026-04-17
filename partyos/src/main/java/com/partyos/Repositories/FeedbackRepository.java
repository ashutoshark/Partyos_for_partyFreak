package com.partyos.Repositories;

 

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.partyos.Entities.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {

    List<Feedback> findByServiceId(Long serviceId);

    List<Feedback> findByServiceUserId(Long userId); // 🔥 vendor feedback
}
