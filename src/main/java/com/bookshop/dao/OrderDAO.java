package com.bookshop.dao;

import com.bookshop.pojo.Order;

import java.util.List;

public interface OrderDAO {
    void addorderindatabase(Order order);
    List<Order> getallorders(Order order);
    Order getorder(int orderid);
}
