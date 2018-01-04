package com.jewelry.cms.controller;

import com.jewelry.cms.bean.entity.Response;
import com.jewelry.cms.bean.jpa.BodyPart;
import com.jewelry.cms.bean.jpa.JewelryMeterial;
import com.jewelry.cms.bean.jpa.JewelryType;
import com.jewelry.cms.dao.BodyPartRepository;
import com.jewelry.cms.dao.JewelryMeterialRepository;
import com.jewelry.cms.dao.JewelryTypeRepository;
import com.jewelry.cms.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@Controller
public class JtypeController {
    @Autowired
    private JewelryMeterialRepository jewelryMeterialRepository;

    @Autowired
    private JewelryTypeRepository jewelryTypeRepository;

    @Autowired
    private BodyPartRepository bodyPartRepository;

    @RequestMapping(value = "/jtype")
    public String getDetails(Model model, @RequestParam("typeId") long typeId){
        Sort sorter = new Sort(Sort.Direction.DESC, "status");

        List<JewelryType> jewelryTypes = jewelryTypeRepository.findAll(sorter);
        model.addAttribute("types", jewelryTypes);

        if (jewelryTypes.size() > 0){
            List<BodyPart> bodyParts;
            if (typeId == 0){
                typeId = jewelryTypes.get(0).getId();
            }
            bodyParts = bodyPartRepository.findByTypeIdEquals(typeId, sorter);
            model.addAttribute("parts", bodyParts);

            List<JewelryMeterial> jewelryMeterials = jewelryMeterialRepository.findAllByTypeId(typeId, sorter);
            model.addAttribute("meterials", jewelryMeterials);

            model.addAttribute("typeId", typeId);
        }

        return "jtype/details";
    }

    @RequestMapping(value = "/type/toModify")
    public String modifyType(Model model, Long typeId){
        JewelryType jewelryType = jewelryTypeRepository.getById(typeId);
        model.addAttribute("type", jewelryType);

        return "jtype/modifyType";
    }

    @RequestMapping(value = "/type/doModify")
    @ResponseBody
    public Response doModifyType(JewelryType jewelryType){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try{
//            JewelryType old = jewelryTypeRepository.getById(jewelryType.getId());
//            if (!old.getStatus().equals(jewelryType.getStatus()) && jewelryType.getStatus() == 0){
//                jewelryMeterialRepository.updateStatusByTypeId(jewelryType.getId(), 0);
//                bodyPartRepository.updateStatusByTypeId(jewelryType.getId(), 0);
//            }
            jewelryTypeRepository.save(jewelryType);

        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }


    @RequestMapping(value = "type/toAdd")
    public String addType(){
        return "jtype/addType";
    }

    @RequestMapping(value = "/type/doAdd")
    @ResponseBody
    public Response doAddType(JewelryType jewelryType){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try{
            long id = 100;

            while (jewelryTypeRepository.getById(id) != null){
                id += 100;
            }
            jewelryType.setId(id);
            jewelryTypeRepository.save(jewelryType);
            response.setData(id);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }

    @RequestMapping(value = "/part/toModify")
    public String modifyPart(Model model, Long partId){

        BodyPart bodyPart = bodyPartRepository.getById(partId);
        model.addAttribute("part", bodyPart);

        JewelryType jewelryType = jewelryTypeRepository.getById(bodyPart.getTypeId());
        model.addAttribute("type", jewelryType);

        return "jtype/modifyPart";
    }

    @RequestMapping(value = "/part/doModify")
    @ResponseBody
    public Response doModifyPart(BodyPart bodyPart){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try{
            bodyPartRepository.save(bodyPart);
            response.setData(bodyPart.getTypeId());
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }

    @RequestMapping(value = "part/toAdd")
    public String addPart(Model model, Long typeId){
        JewelryType jewelryType = jewelryTypeRepository.getById(typeId);
        model.addAttribute("type", jewelryType);

        return "jtype/addPart";
    }

    @RequestMapping(value = "/part/doAdd")
    @ResponseBody
    public Response doAddPart(BodyPart bodyPart){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try{
            long partId = bodyPart.getTypeId() + 1;

            while (bodyPartRepository.getById(partId) != null){
                System.out.println(partId);
                partId ++;
            }
            bodyPart.setId(partId);
            bodyPartRepository.save(bodyPart);
            response.setData(bodyPart.getTypeId());
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }

    @RequestMapping(value = "/meterial/toModify")
    public String modifyMeterial(Model model, Long meterialId){

        JewelryMeterial jewelryMeterial = jewelryMeterialRepository.getById(meterialId);
        model.addAttribute("meterial", jewelryMeterial);

        JewelryType jewelryType = jewelryTypeRepository.getById(jewelryMeterial.getTypeId());
        model.addAttribute("type", jewelryType);

        return "jtype/modifyMeterial";
    }

    @RequestMapping(value = "/meterial/doModify")
    @ResponseBody
    public Response doModifyMeterial(JewelryMeterial jewelryMeterial){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try{
            jewelryMeterialRepository.save(jewelryMeterial);
            response.setData(jewelryMeterial.getTypeId());
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }

    @RequestMapping(value = "meterial/toAdd")
    public String addMeterial(Model model, Long typeId){
        JewelryType jewelryType = jewelryTypeRepository.getById(typeId);
        model.addAttribute("type", jewelryType);

        return "jtype/addMeterial";
    }

    @RequestMapping(value = "/meterial/doAdd")
    @ResponseBody
    public Response doAddMeterial(JewelryMeterial jewelryMeterial){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try{
            jewelryMeterialRepository.save(jewelryMeterial);
            response.setData(jewelryMeterial.getTypeId());
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }
}
