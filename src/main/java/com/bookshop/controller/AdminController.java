package com.bookshop.controller;

import com.bookshop.common.Result;
import com.bookshop.common.ResultGenerator;
import com.bookshop.pojo.Admin;
import com.bookshop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.LinkedHashMap;


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

    @RequestMapping(value = "/logout")
    public  ModelAndView logout(HttpServletRequest request){
        HttpSession s = request.getSession();
        if(s!=null && s.getAttribute("admin")!=null){
            s.removeAttribute("admin");
        }
        request.setAttribute("mode","admin");
        return new  ModelAndView("login");
    }

    @RequestMapping("/gather_user.do")
    public ModelAndView gatherUser(){
        ModelAndView mav =new ModelAndView("admin/gather_template");
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
        ModelAndView mav =new ModelAndView("admin/gather_template");
        mav.addObject("pageName","书籍管理");
        mav.addObject("pageAPI","/data/book");
        mav.addObject("pageField",new LinkedHashMap<String,String>(){
            {
                put("id","ID");
                put("name","书名");
                put("cid","类别编号");
                put("bookType","类型");
                put("price","单价");
                put("originalPrice","原价");
                put("uid","UID");
                put("author","作者");
                put("press","出版社");
                put("version","版本");
                put("degree","评分");
                put("publishDate","出版日期");
                put("description","描述");
                put("date","日期");
            }
        });
        return mav;
    }

    @RequestMapping("/gather_spare.do")
    public ModelAndView gatherSpare(){
        ModelAndView mav =new ModelAndView("admin/gather_template");
        mav.addObject("pageName","闲置物管理");
        mav.addObject("pageAPI","/data/spare");
        mav.addObject("pageField", new LinkedHashMap<String, String>() {
            {
                put("id", "ID");
                put("uid", "用户ID");
                put("name", "名称");
                put("price", "单价");
                put("description", "描述");
            }
        });
        return mav;
    }

    @RequestMapping("/gather_order.do")
    public ModelAndView gatherOrder(){
        ModelAndView mav =new ModelAndView("admin/gather_template");
        mav.addObject("pageName","订单管理");
        mav.addObject("pageAPI","/data/order");
        mav.addObject("pageField", new LinkedHashMap<String, String>() {
            {
                put("orderid", "ID");
                put("bookname", "书名");
                put("userid", "用户ID");
                put("counts", "购买数量");
                put("contactway", "联系方式");
                put("price", "单价");
                put("orderstatus", "订单状态");
            }
        });
        return mav;
    }
}
