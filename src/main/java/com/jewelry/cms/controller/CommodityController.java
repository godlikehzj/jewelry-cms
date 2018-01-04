package com.jewelry.cms.controller;

import com.alibaba.fastjson.JSONArray;
import com.jewelry.cms.bean.entity.Response;
import com.jewelry.cms.bean.jpa.*;
import com.jewelry.cms.dao.*;
import com.jewelry.cms.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.crypto.Data;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
public class CommodityController {

    @Autowired
    private CommodityRepository commodityRepository;

    @Autowired
    private JewelryTypeRepository jewelryTypeRepository;

    @Autowired
    private JewelryMeterialRepository jewelryMeterialRepository;

    @Autowired
    private BodyPartRepository bodyPartRepository;

    @Autowired
    private CPictureRespository cPictureRespository;

    @RequestMapping(value = "commodity/list")
    public String getCommodityList(Model model,
                                   Long typeId,
                                   Long partId,
                                   Long meterialId){
        List<Commodity> commodities = commodityRepository.findAll();


        model.addAttribute("commodities", commodities);
        return "commodity/list";
    }

    @RequestMapping(value = "commodity/add")
    public String toAddCommodity(Model model){
        List<JewelryType> jewelryTypes = jewelryTypeRepository.findAllByStatus(1);

        model.addAttribute("types", jewelryTypes);

        List<BodyPart> bodyParts = bodyPartRepository.findAllByTypeIdAndStatus(jewelryTypes.get(0).getId(), 1);

        model.addAttribute("bodys", bodyParts);

        List<JewelryMeterial> jewelryMeterials = jewelryMeterialRepository.findAllByTypeIdAndStatus(jewelryTypes.get(0).getId(), 1);

        model.addAttribute("meterials", jewelryMeterials);

        return "commodity/add";
    }

    /**
     *
     * @param model
     * @param type 0 为部件 1位材质
     * @return
     */
    @RequestMapping(value = "type/change")
    public String typeChange(Model model, long typeId, int type){
        if (type == 0){
            List<BodyPart> bodyParts = bodyPartRepository.findAllByTypeIdAndStatus(typeId, 1);
            model.addAttribute("datas", bodyParts);
        }else{
            List<JewelryMeterial> jewelryMeterials = jewelryMeterialRepository.findAllByTypeIdAndStatus(typeId, 1);
            model.addAttribute("datas", jewelryMeterials);
        }

        return "commodity/selectChange";
    }


    @RequestMapping(value = "commodity/doAdd")
    @ResponseBody
    public Response addCommodity(Commodity commodity, String detail_img, String list_img){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try{
            commodity.setCreateTime(new Timestamp(new Date().getTime()));
            commodityRepository.save(commodity);
            JSONArray details = JSONArray.parseArray(detail_img);
            for(int i = 0;i<details.size(); i++){
                String img = details.getString(0);
                CPicture cPicture = new CPicture();
                cPicture.setCommodityId(commodity.getId());
                cPicture.setPicName(img);
                cPicture.setPositionType(1);
                cPictureRespository.save(cPicture);
            }

            JSONArray lists = JSONArray.parseArray(list_img);
            for(int i = 0;i<lists.size(); i++){
                String img = lists.getString(0);
                CPicture cPicture = new CPicture();
                cPicture.setCommodityId(commodity.getId());
                cPicture.setPicName(img);
                cPicture.setPositionType(0);
                cPictureRespository.save(cPicture);
            }
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }
        return response;
    }

    @RequestMapping(value = "commodity/modify")
    public String toModifyCommodity(Model model, Long commodityId){
        Commodity commodity = commodityRepository.getCommodityById(commodityId);

        model.addAttribute("commodity", commodity);

        List<JewelryType> jewelryTypes = jewelryTypeRepository.findAllByStatus(1);

        model.addAttribute("types", jewelryTypes);

        List<BodyPart> bodyParts = bodyPartRepository.findAllByTypeIdAndStatus(commodity.getTypeId(), 1);

        model.addAttribute("bodys", bodyParts);

        List<JewelryMeterial> jewelryMeterials = jewelryMeterialRepository.findAllByTypeIdAndStatus(commodity.getTypeId(), 1);

        model.addAttribute("meterials", jewelryMeterials);

        List<CPicture> list_imgs = cPictureRespository.findAllByCommodityIdAndPositionType(commodityId, 0);
        model.addAttribute("list_img", list_imgs);

        List<CPicture> detail_imgs = cPictureRespository.findAllByCommodityIdAndPositionType(commodityId, 1);
        model.addAttribute("detail_img", detail_imgs);

        return "commodity/modify";
    }

    @RequestMapping(value = "commodity/doModify")
    @ResponseBody
    public Response modifyCommodity(Commodity commodity, String detail_img, String list_img){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try{
            commodity.setModifyTime(new Timestamp(new Date().getTime()));
            commodityRepository.save(commodity);
            JSONArray details = JSONArray.parseArray(detail_img);
            for(int i = 0;i<details.size(); i++){
                String img = details.getString(0);
                List<CPicture> pic = cPictureRespository.findAllByPicName(img);
                if (pic == null || pic.size() == 0){
                    CPicture cPicture = new CPicture();
                    cPicture.setCommodityId(commodity.getId());
                    cPicture.setPicName(img);
                    cPicture.setPositionType(1);
                    cPictureRespository.save(cPicture);
                }
            }

            JSONArray lists = JSONArray.parseArray(list_img);
            for(int i = 0;i<lists.size(); i++){
                String img = lists.getString(0);
                List<CPicture> pic = cPictureRespository.findAllByPicName(img);
                if (pic == null || pic.size() == 0) {
                    CPicture cPicture = new CPicture();
                    cPicture.setCommodityId(commodity.getId());
                    cPicture.setPicName(img);
                    cPicture.setPositionType(0);
                    cPictureRespository.save(cPicture);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }
        return response;
    }
}
