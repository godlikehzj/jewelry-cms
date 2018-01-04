package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.JewelryType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JewelryTypeRepository extends JpaRepository<JewelryType, Long> {
    JewelryType getById(long id);

    List<JewelryType> findAllByStatus(int status);
}
