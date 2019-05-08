package com.daniel.service.impl;

import com.daniel.dao.AdminDAO;
import com.daniel.pojo.Admin;
import com.daniel.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDAO dao;

    @Override
    public Admin getAdminByName(String name) {
        return dao.getAdminByName(name);
    }
}
