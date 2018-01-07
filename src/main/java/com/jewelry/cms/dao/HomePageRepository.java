package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.HomePage;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface HomePageRepository extends JpaRepository<HomePage, Long> {
//    @Query("select h from HomePage h where h.status > ?1")
    List<HomePage> findAllByStatusNot(int status, Sort sort);

    @Query("select distinct(h.lineOrder) from HomePage h where h.lineOrder between ?1 and ?2")
    List<Integer> findLineDistinctByLineOrderBetween(int begin, int end, Sort sort);

    List<HomePage> findAllByLineOrder(int lineNum, Sort sort);

    @Transactional
    @Modifying
    @Query(value = "update from HomePage set indexOrder = ?2 where id = ?1")
    void updateIndex(long id, int index);
}
