package com.jewelry.cms.dao;

import com.jewelry.cms.bean.jpa.CPicture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CPictureRespository extends JpaRepository<CPicture, Long> {
    List<CPicture> findAllByCommodityIdAndPositionType(long commodity_id, int position_type);
    List<CPicture> findAllByPicName(String picName);
    @Transactional
    void deleteByPicName(String picName);
}
