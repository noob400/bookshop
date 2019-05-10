package com.bookshop.service;

import com.bookshop.pojo.User;

import java.util.List;

public interface UserService {

    boolean checkUser(User user);
    User get(int id);
    User getByStudentid(String studnetid);

    List<User> getUserList();
}
