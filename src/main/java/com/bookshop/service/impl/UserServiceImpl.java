package com.bookshop.service.impl;

import com.bookshop.common.Utils;
import com.bookshop.dao.UserDAO;
import com.bookshop.pojo.User;
import com.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDAO userDAO;

    @Override
    public boolean checkUser(User user) {
        int flag = userDAO.checkPassword(user);
        return flag==1;
    }

    @Override
    public User get(int id) {
        return userDAO.get(id);
    }

    @Override
    public User getByStudentid(String studnetid) {
        return userDAO.getByStudentid(studnetid);
    }

    @Override
    public List<User> getUserList() {
        return userDAO.getUserList();
    }

    @Override
    public void createUser(HashMap<String,String> m) {
        userDAO.createUser(Utils.fillObjectFromMap(new User(),m));
    }

    @Override
    public void deleteUser(int id) {
        userDAO.deleteUser(id);
    }

    @Override
    public void updateUser(HashMap<String, String> params) {
        userDAO.updateUser(Utils.fillObjectFromMap(new User(),params));
    }

}
