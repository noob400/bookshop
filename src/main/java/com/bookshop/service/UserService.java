package com.bookshop.service;

import com.bookshop.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface UserService {

    boolean checkUser(User user);

    User get(int id);

    User getByStudentid(String studnetid);

    List<User> getUserList();

    void createUser(HashMap<String,String> params);

    void deleteUser(int id);

    void updateUser(HashMap<String,String> params);
}
