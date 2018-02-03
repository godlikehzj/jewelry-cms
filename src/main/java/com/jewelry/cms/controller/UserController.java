package com.jewelry.cms.controller;

import com.jewelry.cms.bean.entity.Response;
import com.jewelry.cms.bean.jpa.User;
import com.jewelry.cms.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "contact")
    public String contact(){
        return "contact";
    }
    @RequestMapping(value = "toLogin")
    public String tologin(){
        return "login";
    }

    @RequestMapping(value = "login")
    @ResponseBody
    public Response login(HttpServletRequest request, User user){
        Response response = new Response();
        User user1 = userRepository.getByName(user.getName());
        if (user1 == null){
            response.setCode(201);
            response.setMsg("用户不存在");
        }else{
            if (!user1.getPwd().equals(user.getPwd())){
                response.setCode(202);
                response.setMsg("密码错误");
            }else{
                response.setCode(0);
                response.setMsg("登录成功");
                request.getSession().setAttribute("user", user1);
            }
        }
        return response;
    }

    @RequestMapping(value = "logout")
    @ResponseBody
    public Response logout(HttpServletRequest request){
        Response response = new Response();
        request.getSession().removeAttribute("user");
        response.setCode(0);
        return response;
    }
}
