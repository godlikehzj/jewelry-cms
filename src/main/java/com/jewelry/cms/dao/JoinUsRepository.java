package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.JoinUs;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JoinUsRepository extends JpaRepository<JoinUs, Long> {
    JoinUs getByStatus(int status);
}
