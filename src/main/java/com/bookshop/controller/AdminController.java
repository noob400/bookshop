package com.bookshop.controller;

import com.bookshop.common.Result;
import com.bookshop.common.ResultGenerator;
import com.bookshop.pojo.Admin;
import com.bookshop.pojo.User;
import com.bookshop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.TreeMap;


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

    @RequestMapping("/gather_user.do")
    public ModelAndView gatherUser(){
        ModelAndView mav =new ModelAndView("admin/gather_user");
        mav.addObject("pageName","用户管理");
        mav.addObject("pageAPI","/data/user");
        mav.addObject("pageField",new LinkedHashMap<String,String>(){
            {
                put("id","ID");
                put("studentid","学号");
                put("name","姓名");
                put("password","密码");
                put("sex","性别");
                put("tel","电话");
                put("address","地址");
                put("major","专业");
            }
        });
        return mav;
    }

    @RequestMapping("/gather_book.do")
    public ModelAndView gatherBook(){
        ModelAndView mav =new ModelAndView("admin/gather_book");
        mav.addObject("pageName","书籍管理");
        mav.addObject("pageAPI","/data/book");
        return mav;
    }

    @RequestMapping("/gather_spare.do")
    public ModelAndView gatherSpare(){
        ModelAndView mav =new ModelAndView("admin/gather_spare");
        mav.addObject("pageName","闲置物管理");
        mav.addObject("pageAPI","/data/spare");
        return mav;
    }

    @RequestMapping("/gather_order.do")
    public ModelAndView gatherOrder(){
        ModelAndView mav =new ModelAndView("admin/gather_order");
        mav.addObject("pageName","订单管理");
        mav.addObject("pageAPI","/data/order");
        return mav;
    }
}
