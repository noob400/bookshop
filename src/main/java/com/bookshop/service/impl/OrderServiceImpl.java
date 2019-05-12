package com.bookshop.service.impl;

import com.bookshop.dao.OrderDAO;
import com.bookshop.pojo.Order;
import com.bookshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl  implements OrderService {

    @Autowired
    OrderDAO orderDAO;
    @Override
    public void addorders(Order order){
         orderDAO.addorderindatabase(order);

    }

    @Override
    public List<Order> get(Order order){
        List<Order> resultlist=orderDAO.getallorders(order);
        return resultlist;
    }

    @Override
    public Order get(int orderid){
        Order result=orderDAO.getorder(orderid);
        return result;
    }
}
