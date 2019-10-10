package com.bookshop.service;

import com.bookshop.pojo.Order;

import java.util.List;

public interface OrderService {
    void addorders(Order order);
    List<Order> get(Order order);
    Order get(int orderid);
    int ordercount();
    void delete(int orderid);
}
