package com.bookshop.controller;


import com.bookshop.pojo.User;
import com.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

    /**
     * Return gathered user data
     * @return apply format [data:[]] or {data:[]}
     */
    @RequestMapping("user.json")
    @ResponseBody
    public HashMap<String,List<User>> getUserJson(){
        HashMap<String,List<User>> m = new HashMap<>();
        m.put("data",userService.getUserList());
        return m;
    }
}
