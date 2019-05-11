package com.bookshop.dao;

import com.bookshop.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface UserDAO {

    User get(int id);

    void update(User user);

    int checkPassword(User user);

    User getByStudentid(String studentid);

    List<User> getUserList();

    void createUser(User u);

    void updateUser(User u);

    void deleteUser(int id);

}
