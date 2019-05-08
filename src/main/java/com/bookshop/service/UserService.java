package com.bookshop.service;

import com.bookshop.pojo.User;

public interface UserService {

    boolean checkUser(User user);
    User get(int id);
    User getByStudentid(String studnetid);

}
