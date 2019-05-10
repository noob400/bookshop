package com.bookshop.service.impl;

import com.bookshop.dao.AdminDAO;
import com.bookshop.pojo.Admin;
import com.bookshop.service.AdminService;
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
