package com.bookshop.dao;

import com.bookshop.pojo.Admin;

public interface AdminDAO {
    Admin getAdminByName(String username);
}