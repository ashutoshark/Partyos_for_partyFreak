package com.partyos.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partyos.Entities.UserProfile;

public interface UserProfileRepository extends JpaRepository<UserProfile, Long> {

    UserProfile findByUserId(Long userId);
}
