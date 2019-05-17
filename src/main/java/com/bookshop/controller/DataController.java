package com.bookshop.controller;


import com.bookshop.common.Constants;
import com.bookshop.common.Utils;
import com.bookshop.dao.OrderDAO;
import com.bookshop.dao.SpareDAO;
import com.bookshop.pojo.Book;
import com.bookshop.pojo.Order;
import com.bookshop.pojo.Spare;
import com.bookshop.pojo.User;
import com.bookshop.service.BookService;
import com.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

// This controller is used as APIs for front-end to provide json data so that
// front-end could render those json data to proper table format

@RestController
@RequestMapping("/data")
public class DataController {
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;
    @Autowired
    private SpareDAO spareDAO;
    @Autowired
    private OrderDAO orderDAO;

    ///////////////////////////////////////////////////////////
    // 用户API
    ///////////////////////////////////////////////////////////
    @RequestMapping("user.json")
    @ResponseBody
    public List<User> getUserData(){
        return userService.getUserList();
    }

    @RequestMapping(value = "/user/modify.json", method = RequestMethod.POST)
    @ResponseBody
    public int modifyUserData(HttpServletRequest request){
        HashMap<String,String> d =Utils.getRequestMap(request.getParameterMap());
        if(!d.containsKey("id")){
            return Constants.RESULT_CODE_BAD_REQUEST;
        }

        if(userService.get(Integer.parseInt(d.get("id")))!=null){
            //Update
            userService.updateUser(d);
        }else{
            //Create
            userService.createUser(d);
        }

        return Constants.RESULT_CODE_SUCCESS;
    }

    @RequestMapping(value = "/user/delete.json",method = RequestMethod.POST)
    @ResponseBody
    public int deleteUserData(HttpServletRequest request){
        if(request.getParameter("id")!=null){
            userService.deleteUser(Integer.parseInt(request.getParameter("id")));
            return Constants.RESULT_CODE_SUCCESS;
        }else{
            return Constants.RESULT_CODE_BAD_REQUEST;
        }
    }

    ///////////////////////////////////////////////////////////
    // 书籍API
    ///////////////////////////////////////////////////////////
    @RequestMapping("book.json")
    @ResponseBody
    public List<Book> getBookData(){
        return bookService.list();
    }

    @RequestMapping(value = "/book/modify.json", method = RequestMethod.POST)
    @ResponseBody
    public int modifyBookData(HttpServletRequest request){
        HashMap<String,String> d =Utils.getRequestMap(request.getParameterMap());
        if(!d.containsKey("id")){
            return Constants.RESULT_CODE_BAD_REQUEST;
        }

        if(bookService.get(Integer.parseInt(d.get("id")))!=null){
            bookService.update(Utils.fillObjectFromMap(new Book(),d));
        }else{
            bookService.add(Utils.fillObjectFromMap(new Book(),d));
        }

        return Constants.RESULT_CODE_SUCCESS;
    }

    @RequestMapping(value = "/book/delete.json",method = RequestMethod.POST)
    @ResponseBody
    public int deleteBookData(HttpServletRequest request) {
        if (request.getParameter("id") != null) {
            bookService.delete(Integer.parseInt(request.getParameter("id")));
            return Constants.RESULT_CODE_SUCCESS;
        } else {
            return Constants.RESULT_CODE_BAD_REQUEST;
        }
    }


    ///////////////////////////////////////////////////////////
    // 闲置物API
    ///////////////////////////////////////////////////////////
    @RequestMapping("spare.json")
    @ResponseBody
    public List<Spare> getSpareData() {
        return spareDAO.getAllSpare();
    }

    @RequestMapping(value = "/spare/modify.json", method = RequestMethod.POST)
    @ResponseBody
    public int modifySpareData(HttpServletRequest request) {
        return Constants.RESULT_CODE_SUCCESS;
    }

    @RequestMapping(value = "/spare/delete.json", method = RequestMethod.POST)
    @ResponseBody
    public int deleteSpareData(HttpServletRequest request) {
        if(request.getParameter("id")!=null){
            spareDAO.delete(Integer.parseInt(request.getParameter("id")));
            return Constants.RESULT_CODE_SUCCESS;
        }else{
            return Constants.RESULT_CODE_BAD_REQUEST;
        }
    }

    ///////////////////////////////////////////////////////////
    // 订单API
    ///////////////////////////////////////////////////////////
    @RequestMapping("order.json")
    @ResponseBody
    public List<Order> getOrderData() {
        return orderDAO.getOrders();
    }

    @RequestMapping(value = "/order/modify.json", method = RequestMethod.POST)
    @ResponseBody
    public int modifyOrderData(HttpServletRequest request) {
        return Constants.RESULT_CODE_SUCCESS;
    }

    @RequestMapping(value = "/order/delete.json", method = RequestMethod.POST)
    @ResponseBody
    public int deleteOrderData(HttpServletRequest request) {
        if (request.getParameter("id") != null) {
            orderDAO.delete(Integer.parseInt(request.getParameter("id")));
            return Constants.RESULT_CODE_SUCCESS;
        } else {
            return Constants.RESULT_CODE_BAD_REQUEST;
        }
    }

}
