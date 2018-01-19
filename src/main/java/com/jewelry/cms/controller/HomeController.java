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

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    private BannerRepository bannerRepository;

    @Autowired
    private JewelryTypeRepository jewelryTypeRepository;

    @Autowired
    private JewelryMeterialRepository jewelryMeterialRepository;

    @Autowired
    private BodyPartRepository bodyPartRepository;

    @Autowired
    private CommodityRepository commodityRepository;

    @Autowired
    private HomePageRepository homePageRepository;

    @RequestMapping("body/change")
    public String bodyChange(Model model, Long bodyId){
        List<Commodity> commodities = commodityRepository.findAllByPartId(bodyId, null);
        model.addAttribute("datas", commodities);
        return "common/commodityChange";
    }

    @RequestMapping("banner/list")
    public String getBannerList(Model model){
        List<Banner> banners = bannerRepository.findAll();
        model.addAttribute("banners", banners);
        return "home/banner/list";
    }

    @RequestMapping("banner/toAdd")
    public String toAddBanner(Model model){
        List<JewelryType> jewelryTypes = jewelryTypeRepository.findAllByStatus(1);

        model.addAttribute("types", jewelryTypes);

        List<BodyPart> bodyParts = bodyPartRepository.findAllByTypeIdAndStatus(jewelryTypes.get(0).getId(), 1);

        model.addAttribute("bodys", bodyParts);

        if (bodyParts.size() > 0){
            List<Commodity> commodities = commodityRepository.findAllByPartId(bodyParts.get(0).getId(), null);
            model.addAttribute("commodities", commodities);
        }

        return "home/banner/add";
    }

    @RequestMapping("banner/doAdd")
    @ResponseBody
    public Response addBanner(Banner banner){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try {
            Sort sorter = new Sort(Sort.Direction.DESC, "pindex");
            List<Banner> bannerList = bannerRepository.findAll(sorter);
            if (bannerList.size() > 0){
                banner.setPindex(bannerList.get(0).getPindex() + 1);
                bannerRepository.save(banner);
            }
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);

        }

        return response;
    }

    @RequestMapping("banner/toModify")
    public String toModifyBanner(Model model, Long bid){
        Banner banner = bannerRepository.getOne(bid);

        model.addAttribute("banner", banner);

        List<JewelryType> jewelryTypes = jewelryTypeRepository.findAllByStatus(1);

        model.addAttribute("types", jewelryTypes);

        Commodity commodity = commodityRepository.getCommodityById(banner.getGoId());
        Long typeId = 0L;
        Long bodyId = 0L;

        if (commodity == null){
            bodyId = banner.getGoId();
            typeId = bodyId/100 * 100;
        }else{
            bodyId = commodity.getPartId();
            typeId = commodity.getTypeId();
        }

        List<BodyPart> bodyParts = bodyPartRepository.findAllByTypeIdAndStatus(typeId, 1);

        model.addAttribute("bodys", bodyParts);

        List<Commodity> commodities = commodityRepository.findAllByPartId(bodyId, null);
        model.addAttribute("commodities", commodities);

        model.addAttribute("bodyId", bodyId);

        model.addAttribute("typeId", typeId);

        return "home/banner/modify";
    }

    @RequestMapping("banner/doModify")
    @ResponseBody
    public Response modifyBanner(Banner banner){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            bannerRepository.save(banner);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);

        }

        return response;
    }

    @RequestMapping("banner/delete")
    @ResponseBody
    public Response deleteBanner(Long id){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            bannerRepository.delete(id);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);

        }

        return response;
    }

    @RequestMapping("banner/order")
    @ResponseBody
    public Response orderBanner(String order){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            JSONArray jsonArray = JSONArray.parseArray(order);
            for(int i = 0; i < jsonArray.size(); i++){
                bannerRepository.updateIndex(jsonArray.getInteger(i), i+1);
            }
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }



    @RequestMapping("page/list")
    public String getPageList(Model model, int type, Integer line){
        //获取首页内容信息

        int begin = type * 1000;
        int end = (type+1) * 1000;
        List<Integer> lines = homePageRepository.findLineDistinctByLineOrderBetween(begin, end, new Sort(Sort.Direction.ASC, "lineOrder"));

        if (lines.size() > 0){
            if (line == null){
//            line = lines.get(0).getLineOrder();
                line = lines.get(0);
            }else{
                line  = line + type * 1000;
            }
        }
        model.addAttribute("lines", lines);

        model.addAttribute("cline", line);
        List<HomePage> homePages = new ArrayList<HomePage>();
        if (line != null){
            homePages = homePageRepository.findAllByLineOrder(line, new Sort(Sort.Direction.ASC, "indexOrder"));
        }
        model.addAttribute("pages", homePages);
        model.addAttribute("type", type);
        return "home/page/list";
    }

    @RequestMapping("page/toAdd")
    public String toAddPage(Model model, int type){
        int begin = type * 1000;
        int end = (type+1) * 1000;

        List<Integer> lines = homePageRepository.findLineDistinctByLineOrderBetween(begin, end, new Sort(Sort.Direction.ASC, "lineOrder"));

        model.addAttribute("lines", lines);

        if (lines == null || lines.size() ==0)
            model.addAttribute("newLine", begin + 1);
        else
            model.addAttribute("newLine", lines.get(lines.size() - 1) + 1);

        List<JewelryType> jewelryTypes = jewelryTypeRepository.findAllByStatus(1);

        model.addAttribute("types", jewelryTypes);

        List<BodyPart> bodyParts = bodyPartRepository.findAllByTypeIdAndStatus(jewelryTypes.get(0).getId(), 1);

        model.addAttribute("bodys", bodyParts);

        if (bodyParts.size() > 0){
            List<Commodity> commodities = commodityRepository.findAllByPartId(bodyParts.get(0).getId(), null);
            model.addAttribute("commodities", commodities);
        }
        model.addAttribute("type", type);

        return "home/page/add";
    }


    @RequestMapping("page/doAdd")
    @ResponseBody
    public Response addPage(HomePage homePage){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);;
        try {
            List<HomePage> homePages = homePageRepository.findAllByLineOrder(homePage.getLineOrder(), new Sort(Sort.Direction.ASC, "indexOrder"));

            if (homePages != null && homePages.size() > 0){
                homePage.setIndexOrder(homePages.size() + 1);
            }else{
                homePage.setIndexOrder(1);
            }

            homePageRepository.save(homePage);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);

        }

        return response;
    }

    @RequestMapping("page/delete")
    @ResponseBody
    public Response pageDelete(Long id){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            HomePage homePage = homePageRepository.getOne(id);
            homePageRepository.delete(id);
            List<HomePage> homePages = homePageRepository.findAllByLineOrder(homePage.getLineOrder(), new Sort(Sort.Direction.ASC, "indexOrder"));
            if (homePages != null && homePages.size() > 0){
                for(int i = 0; i < homePages.size(); i++){
                    homePageRepository.updateIndex(homePages.get(i).getId(), i+1);
                }
            }

        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }

    @RequestMapping("page/order")
    @ResponseBody
    public Response orderPage(String order){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            JSONArray jsonArray = JSONArray.parseArray(order);
            for(int i = 0; i < jsonArray.size(); i++){
                homePageRepository.updateIndex(jsonArray.getInteger(i), i+1);
            }
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }

    @RequestMapping("page/toModify")
    public String toModifyPage(Model model, int type, Long id){
        HomePage homePage = homePageRepository.findOne(id);
        Long goId = homePage.getGoId();

        model.addAttribute("homepage",homePage);

        List<JewelryType> jewelryTypes = jewelryTypeRepository.findAllByStatus(1);

        model.addAttribute("types", jewelryTypes);

        Long typeId;
        Long bodyId;

        if (homePage.getcType() == 2 && goId != null){
            Commodity commodity = commodityRepository.getCommodityById(goId);
            if (commodity == null){
                bodyId = goId;
                typeId = bodyId/100 * 100;
            }else{
                bodyId = commodity.getPartId();
                typeId = commodity.getTypeId();
            }
        }else{
            bodyId = 0L;
            typeId = jewelryTypes.get(0).getId();
        }

        List<BodyPart> bodyParts = bodyPartRepository.findAllByTypeIdAndStatus(typeId, 1);

        model.addAttribute("bodys", bodyParts);

        if (homePage.getcType() != 2){
            bodyId = bodyParts.get(0).getId();
        }
        List<Commodity> commodities = commodityRepository.findAllByPartId(bodyId, null);
        model.addAttribute("commodities", commodities);

        model.addAttribute("bodyId", bodyId);

        model.addAttribute("typeId", typeId);



        model.addAttribute("type", type);

        return "home/page/modify";
    }

    @RequestMapping("page/doModify")
    @ResponseBody
    public Response modifyPage(HomePage homePage){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            homePageRepository.save(homePage);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);

        }

        return response;
    }
}
