package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.JewelryMeterial;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JewelryMeterialRepository extends JpaRepository<JewelryMeterial, Long> {

    JewelryMeterial getById(Long meterialId);

    List<JewelryMeterial> findAllByTypeId(long type_id, Sort sort);

    List<JewelryMeterial> findAllByTypeIdAndStatus(Long typeId, int status);

    @Query(value = "update from JewelryMeterial set status = ?2 where typeId = ?1")
    void updateStatusByTypeId(long type_id, int status);
}
