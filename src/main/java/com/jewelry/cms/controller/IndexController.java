package com.jewelry.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class IndexController {
    @RequestMapping("/")
    public String welcome(Map<String, Object> model) {
        return "index";
    }
}
