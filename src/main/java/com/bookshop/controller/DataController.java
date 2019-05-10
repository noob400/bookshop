package com.bookshop.controller;


import com.bookshop.common.Utils;
import com.bookshop.pojo.User;
import com.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

// This controller is used as APIs for front-end to provide json data so that
// front-end could render those json data to proper table format

@RestController
@RequestMapping("/data")
public class DataController {
    private final UserService userService;

    @Autowired
    public DataController(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("user.json")
    @ResponseBody
    public HashMap<String,List<User>> getUserData(){
        HashMap<String,List<User>> m = new HashMap<>();
        m.put("data",userService.getUserList());
        return m;
    }

    @RequestMapping(value = "/user/create.json", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String,String> createUserData(HttpServletRequest request){
        HashMap<String,String> d = Utils.getStrippedRequestParams(request.getParameterMap());
        System.out.println(d);

        HashMap<String,String> m = new HashMap<>();
        m.put("data","ok");
        return m;
    }
    @RequestMapping(value = "/user/update.json", method = RequestMethod.PUT)
    @ResponseBody
    public String updateUserData(@RequestBody String data,HttpServletRequest request){

        request.getParameterMap().forEach((a,b)->{
            System.out.print("key:"+a+",value:");
            for(String s:b){
                System.out.print(s+",");
            }
        });
        System.out.println(data);
        return "ok";
    }
    @RequestMapping(value = "/user/delete.json",method = RequestMethod.DELETE)
    @ResponseBody
    public String deleteUserData(HttpServletRequest request){
        request.getParameterMap().forEach((a,b)->{
            System.out.print("key:"+a+",value:");
            for(String s:b){
                System.out.print(s+",");
            }
        });
        return "ok";
    }
}
