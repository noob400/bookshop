package com.bookshop.controller;

import com.bookshop.common.Result;
import com.bookshop.common.ResultGenerator;
import com.bookshop.pojo.Book;
import com.bookshop.pojo.User;
import com.bookshop.service.BookService;
import com.bookshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @RequestMapping("changeselfmassege.do")
    @ResponseBody
    public Result changeselfmassege(User user, HttpServletRequest request){
        User user1= (User) request.getSession().getAttribute("user");
        user.setId(user1.getId());
        user.setStudentid(user1.getStudentid());
        userService.updatesomemassege(user);
        User newuser=userService.getByStudentid(user.getStudentid());
        request.getSession().setAttribute("user",newuser);
        List<Book> books = bookService.listByUserId(newuser.getId(),1);
        List<Book> askBooks = bookService.listByUserId(newuser.getId(),0);
        request.getSession().setAttribute("user",newuser);
        request.getSession().setAttribute("books",books);
        request.getSession().setAttribute("askBooks",askBooks);
        return ResultGenerator.genSuccessResult();
    }

    @RequestMapping("/intoprofile")
    public ModelAndView intoprofile(HttpServletRequest request){
        ModelAndView mav=new ModelAndView("myBookshelf");
        User user=(User)request.getSession().getAttribute("user");
        mav.addObject("user",user);
        mav.addObject("books",request.getSession().getAttribute("books"));
        mav.addObject("askBooks",request.getSession().getAttribute("askBooks"));
        return mav;
    }
}

