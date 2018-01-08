package com.jewelry.cms.controller;

import com.jewelry.cms.bean.entity.Response;
import com.jewelry.cms.bean.jpa.JoinUs;
import com.jewelry.cms.dao.JoinUsRepository;
import com.jewelry.cms.utils.ApiStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/joinus")
public class JoinUsController {
    @Autowired
    private JoinUsRepository joinUsRepository;

    @RequestMapping(value = "/detail")
    public String getDetail(Model model){
        List<JoinUs> joinUs = joinUsRepository.findAll();
        model.addAttribute("joinus", joinUs.get(0));
        return "joinus/detail";
    }

    @RequestMapping(value = "toModify")
    public String toModify(Model model){
        List<JoinUs> joinUs = joinUsRepository.findAll();
        model.addAttribute("joinus", joinUs.get(0));

        return "joinus/modify";
    }

    @RequestMapping(value = "doModify")
    @ResponseBody
    public Response modify(JoinUs joinUs){
        Response response = new Response(ApiStatus.ok, ApiStatus.msg.get(ApiStatus.ok), null);
        try {
            joinUs.setCreateTime(new Timestamp(new Date().getTime()));
            joinUsRepository.save(joinUs);
        }catch (Exception e){
            e.printStackTrace();
            response = new Response(ApiStatus.err, ApiStatus.msg.get(ApiStatus.err), null);

        }

        return response;
    }
}
