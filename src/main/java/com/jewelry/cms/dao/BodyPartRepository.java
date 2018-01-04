package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.BodyPart;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BodyPartRepository extends JpaRepository<BodyPart, Long> {

    BodyPart getById(Long id);

    List<BodyPart> findByTypeIdEquals(Long typeId, Sort sort);

    List<BodyPart> findAllByTypeIdAndStatus(Long typeId, int status);

    @Query(value = "update from BodyPart set status = ?2 where typeId = ?1")
    void updateStatusByTypeId(long type_id, int status);
}
