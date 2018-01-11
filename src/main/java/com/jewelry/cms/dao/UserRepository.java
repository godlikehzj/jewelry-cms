package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, String> {
    User getByName(String name);
}
