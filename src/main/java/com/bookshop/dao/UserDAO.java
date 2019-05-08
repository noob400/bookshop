package com.bookshop.dao;

import com.bookshop.pojo.User;

public interface UserDAO {

    User get(int id);

    void update(User user);

    int checkPassword(User user);

    User getByStudentid(String studentid);

}
