package com.jewelry.cms.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jewelry.cms.bean.entity.Response;
import com.jewelry.cms.bean.jpa.AboutUs;
import com.jewelry.cms.dao.AboutUsRepository;
import com.jewelry.cms.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/aboutUs")
public class AboutUsController {
    @Autowired
    private AboutUsRepository aboutUsRepository;

    @RequestMapping(value = "/detail")
    public String getDetail(Model model){
        List<AboutUs> aboutUsList = aboutUsRepository.findAll();
        model.addAttribute("details", aboutUsList);

        if (aboutUsList.size() > 0)
            model.addAttribute("current", aboutUsList.get(0));

        return "aboutUs/detail";
    }

    @RequestMapping(value = "toModify")
    public String toModify(Model model, Long id){
        AboutUs aboutUs = aboutUsRepository.getOne(id);
        model.addAttribute("about", aboutUs);

        return "aboutUs/modify";
    }

    @RequestMapping(value = "doModify")
    @ResponseBody
    public Response doModify(AboutUs aboutUs){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            aboutUs.setCreateTime(new Timestamp(new Date().getTime()));
            aboutUsRepository.save(aboutUs);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }

    @RequestMapping(value = "toAdd")
    public String toAdd(Model model){
        return "aboutUs/add";
    }

    @RequestMapping(value = "doAdd")
    @ResponseBody
    public Response doAdd(AboutUs aboutUs){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            aboutUs.setCreateTime(new Timestamp(new Date().getTime()));
            aboutUsRepository.save(aboutUs);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }

    @RequestMapping(value = "getOne")
    @ResponseBody
    public JSONObject getOne(Long id){
        AboutUs aboutUs = aboutUsRepository.getOne(id);
        JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(aboutUs));
        return jsonObject;
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public Response delete(Long id){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            aboutUsRepository.delete(id);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);
        }

        return response;
    }
}
