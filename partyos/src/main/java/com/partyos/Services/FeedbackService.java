package com.partyos.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partyos.Entities.Feedback;
import com.partyos.Repositories.FeedbackRepository;

@Service
public class FeedbackService {

    @Autowired
    private FeedbackRepository feedbackRepository;

    public void saveFeedback(Feedback feedback) {
        feedbackRepository.save(feedback);
    }

    public List<Feedback> getVendorFeedback(Long vendorId) {
        return feedbackRepository.findByServiceUserId(vendorId);
    }
}
