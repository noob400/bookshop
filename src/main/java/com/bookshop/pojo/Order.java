package com.bookshop.pojo;

public class Order {

    private double price;

    private String userid;

    private int orderid;

    private int counts;

    private String contactway;

    private String contactname;

    private String orderstatus;

    private String bookname;

    public String getBookname(){
        return bookname;
    }

    public void setBookname(String bookname){
        this.bookname=bookname;
    }
    public String getUserid(){
        return userid;
    }

    public void setUserid(String userid){
        this.userid=userid;
    }
    public String getOrderstatus(){
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus){
        this.orderstatus=orderstatus;
    }

    public int getOrderid(){
        return orderid;
    }

    public void setOrderid(int orderid){
        this.orderid=orderid;
    }

    public int getCounts(){
        return counts;
    }

    public void setCounts(int counts){
        this.counts=counts;
    }

    public String getContactway(){
        return contactway;
    }

    public void setContactway(String contactway){
        this.contactway=contactway;
    }

    public String getContactname(){
        return contactname;
    }

    public void setContactname(String contactname){
        this.contactname=contactname;
    }

    public double getPrice(){
        return price;
    }

    public void setPrice(double price){
        this.price=price;
    }

}
