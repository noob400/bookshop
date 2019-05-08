package com.daniel.dao;

import com.daniel.pojo.Admin;

public interface AdminDAO {
    Admin getAdminByName(String username);
}