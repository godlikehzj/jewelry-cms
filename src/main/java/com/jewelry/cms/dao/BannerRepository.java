package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.Banner;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BannerRepository extends JpaRepository<Banner, Long> {
    List<Banner> findAllByStatusIsNot(int status);
}
