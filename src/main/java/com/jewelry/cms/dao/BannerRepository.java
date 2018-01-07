package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.Banner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BannerRepository extends JpaRepository<Banner, Long> {
    List<Banner> findAllByStatusIsNot(int status);

    @Transactional
    @Modifying
    @Query(value = "update from Banner set pindex = ?2 where id = ?1")
    void updateIndex(long id, int index);
}
