package com.jewelry.cms.controller;

import com.jewelry.cms.bean.jpa.Banner;
import com.jewelry.cms.dao.BannerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    private BannerRepository bannerRepository;

    @RequestMapping("banner/list")
    public String getBannerList(Model model){
        List<Banner> banners = bannerRepository.findAll();
        model.addAttribute("banners", banners);
        return "banner/list";
    }
}
