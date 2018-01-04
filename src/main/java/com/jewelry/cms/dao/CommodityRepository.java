package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.Commodity;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommodityRepository extends JpaRepository<Commodity, Long> {
//    @Query("select c from Commodity c where c.typeId = ?1")
    List<Commodity> findAllByTypeId(long type_id, Sort sort);

//    @Query("select c from Commodity c where c.typeId = ?1 and c.meterialId in ?2")
    List<Commodity> findAllByTypeIdAndMeterialIdIn(long type_id, List<Long> meterial_id, Sort sort);

//    @Query("select c from Commodity c where c.typeId = ?1 and c.meterialId = ?2")
    List<Commodity> findAllByPartId(long part_id, Sort sort);

//    @Query("select c from Commodity c where c.typeId = ?1 and c.part_id = ?2 and c.meterial_id in ?3")
    List<Commodity> findAllByPartIdAndMeterialIdIn(long part_id, List<Long> meterial_id, Sort sort);

    Commodity getCommodityById(long id);

//    @Query("select c from Commodity c join c.jewelryType t where t.id = c.typeId")
//    List<Commodity> findAllwithName();
}
