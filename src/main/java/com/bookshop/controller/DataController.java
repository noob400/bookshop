package com.bookshop.controller;


import com.bookshop.pojo.User;
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

    /**
     * Return gathered user data
     * @return apply format [data:[]] or {data:[]}
     */
    @RequestMapping("user.json")
    @ResponseBody
    public HashMap<String,List<User>> getUserJson(){
        HashMap<String,List<User>> m = new HashMap<>();

        ArrayList<User> list = new ArrayList<>();

        User u = new User();
        u.setId(23);
        u.setName("sdgsd");
        u.setPassword("sgsd");
        list.add(u);
        m.put("data",list);
        return m;
    }
}
