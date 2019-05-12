package com.bookshop.controller;

import com.bookshop.pojo.Book;
import com.bookshop.pojo.User;
import com.bookshop.service.BookService;
import com.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/edit")
public class EditController {

    @Autowired
    UserService userService;

    @Autowired
    BookService bookService;


    @RequestMapping("/editself.do")
    public ModelAndView edit(){
        return new ModelAndView("editself");
    }

    @RequestMapping(value = "/changeselfmassege.do",method = RequestMethod.POST)
    public ModelAndView changeselfmassege(User user, HttpServletRequest request){
        User user1= (User) request.getSession().getAttribute("user");
        user.setId(user1.getId());
        user.setStudentid(user1.getStudentid());
        userService.update(user);
        User newuser=userService.getByStudentid(user.getStudentid());
        ModelAndView mav=new ModelAndView("myBookshelf");
        mav.addObject("user",newuser);
        List<Book> books = bookService.listByUserId(newuser.getId(),1);
        List<Book> askBooks = bookService.listByUserId(newuser.getId(),0);
        request.getSession().setAttribute("user",newuser);
        mav.addObject("books",books);
        mav.addObject("askBooks",askBooks);
        return mav;
    }
}

