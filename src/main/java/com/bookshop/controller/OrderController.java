package com.bookshop.controller;

import com.bookshop.common.Result;
import com.bookshop.common.ResultGenerator;
import com.bookshop.pojo.Book;
import com.bookshop.pojo.Order;
import com.bookshop.pojo.Page;
import com.github.pagehelper.PageHelper;
import com.bookshop.pojo.User;
import com.bookshop.service.BookImageService;
import com.bookshop.service.BookService;
import com.bookshop.service.OrderService;
import com.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    BookService bookService;

    @Autowired
    BookImageService bookImageService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/order/{id}",method = RequestMethod.GET)
    public ModelAndView placeorder(@PathVariable("id") String id ,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("writeorder");
        int intId = Integer.parseInt(id);
        Book curBook = bookService.get(intId);
        curBook.setBookImage(bookImageService.getByBookId(intId));
        curBook.setUser(userService.get(bookService.getUserId(intId)));
        request.getSession().setAttribute("currentbook",curBook);
        mav.addObject("book",curBook);
        return mav;
    }

    @RequestMapping("/addorder")
    @ResponseBody
    public Result addorder( Order order,HttpServletRequest request) {
            User user = (User) request.getSession().getAttribute("user");
            Book currentbook = (Book) request.getSession().getAttribute("currentbook");
            order.setPrice(currentbook.getPrice()*order.getCounts());
            order.setBookname(currentbook.getName());
            order.setUserid(user.getStudentid());
            orderService.addorders(order);
            List<Order> orderlist = orderService.get(order);
            request.getSession().setAttribute("orders",orderlist);
            return ResultGenerator.genSuccessResult();
        }

    @RequestMapping("/intomyorders")
    public ModelAndView intomyorders(Page page, Order order, HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        order.setUserid(user.getStudentid());
        List<Order> orderlist=orderService.get(order);
        int total = orderService.ordercount();
        page.calculateEnd(total);
        if (page.getStart() < 0) {
            page.setStart(0);
        }else if (page.getStart() > total){
            page.setEnd(page.getEnd());
        }
        PageHelper.offsetPage(page.getStart(),16);
        if(orderlist.size()==0){
            ModelAndView mav=new ModelAndView("myorders");
            Order order1=new Order();
            order1.setOrderid(-1);
            orderlist.add(order1);
            mav.addObject("orders",orderlist);
            return mav;
        }else {
            ModelAndView mav=new ModelAndView("myorders");
            mav.addObject("orders",orderlist);
            return mav;

        }
    }

    @RequestMapping("pay.do")
    public ModelAndView topay(Order order){
        return  new ModelAndView("topay");
    }

    @RequestMapping(value="/deleteorder.do/{orderid}",method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("orderid")int orderid,Order order, HttpServletRequest request){
        orderService.delete(orderid);
        User user=(User)request.getSession().getAttribute("user");
        order.setUserid(user.getStudentid());
        List<Order> orderlist=orderService.get(order);
        if(orderlist.size()==0){
            ModelAndView mav=new ModelAndView("myorders");
            Order order1=new Order();
            order1.setOrderid(-1);
            orderlist.add(order1);
            mav.addObject("orders",orderlist);
            return mav;
        }else {
            ModelAndView mav=new ModelAndView("myorders");
            mav.addObject("orders",orderlist);
            return mav;

        }
    }
}
