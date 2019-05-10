package com.bookshop.dao;

import com.bookshop.pojo.User;

import java.util.List;

public interface UserDAO {

    User get(int id);

    void update(User user);

    int checkPassword(User user);

    User getByStudentid(String studentid);

    List<User> getUserList();

}
