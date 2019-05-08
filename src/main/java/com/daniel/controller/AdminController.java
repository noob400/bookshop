package com.daniel.controller;

import com.daniel.common.Result;
import com.daniel.common.ResultGenerator;
import com.daniel.pojo.Admin;
import com.daniel.pojo.User;
import com.daniel.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;


@RequestMapping("/admin")
@RestController
public class AdminController {
    @Autowired
    private AdminService service;

    @RequestMapping(value = {""})
    public ModelAndView adminLogin(){
        ModelAndView mav = new ModelAndView("login");
        mav.addObject("mode","admin");
        return mav;
    }

    @RequestMapping(value = "/checkLogin", method= RequestMethod.POST)
    public Result checkLogin(@RequestBody Admin a,HttpServletRequest request){
        Admin admin = service.getAdminByName(a.getName());
        if(admin==null || a.getPassword()==null
                || !admin.getPassword().equals(a.getPassword())){
            return ResultGenerator.genFailResult("管理员用户名或者密码不正确");
        }
        request.getSession().setAttribute("admin", a.getName());
        return ResultGenerator.genSuccessResult(new HashMap<String,String>(){
            {
                this.put("admin", a.getName());
            }
        });
    }
}
