package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.HomePage;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HomePageRepository extends JpaRepository<HomePage, Long> {
//    @Query("select h from HomePage h where h.status > ?1")
    List<HomePage> findAllByStatusNot(int status, Sort sort);
}
