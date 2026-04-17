package com.partyos.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.partyos.Entities.User;
import com.partyos.Entities.UserProfile;
import com.partyos.Repositories.UserProfileRepository;

@Service
public class UserProfileService {

    @Autowired
    private UserProfileRepository repo;

    public UserProfile getProfile(Long userId) {
        return repo.findByUserId(userId);
    }

    public void saveProfile(UserProfile profile, User user) {

        UserProfile existing = repo.findByUserId(user.getId());

        if (existing != null) {
            existing.setPhone(profile.getPhone());
            existing.setAddress(profile.getAddress());
            existing.setCity(profile.getCity());
            repo.save(existing);
        } else {
            profile.setUser(user);
            repo.save(profile);
        }
    }
}