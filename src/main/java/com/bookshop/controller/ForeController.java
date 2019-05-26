package com.bookshop.controller;

import com.bookshop.dao.SpareDAO;
import com.bookshop.pojo.*;
import com.bookshop.service.BookService;
import com.bookshop.service.CategoryService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class ForeController {
    @Autowired
    private SpareDAO spareDAO;

    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/home.do")
    public ModelAndView goHome() {
        ModelAndView mav =new ModelAndView("home");
        Map<Integer, String> categories = categoryService.listByMap();
        Map<Category,List<Book>> booksMap = bookService.listByCategory();
        mav.addObject("categories",categories);
        mav.addObject("booksMap",booksMap);
        return mav;
    }

    @RequestMapping("/myBookshelf.do")
    public ModelAndView goMyBookshelf(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("myBookshelf");
        User user = (User) request.getSession().getAttribute("user");
        List<Book> books = bookService.listByUserId(user.getId(),1);
        List<Book> askBooks = bookService.listByUserId(user.getId(),0);
        request.getSession().setAttribute("askBooks",askBooks);
        mav.addObject("books",books);
        mav.addObject("askBooks",askBooks);
        return mav;
    }

    @RequestMapping("/goUpload.do")
    public ModelAndView upload(Book book){
        String path = book.getBookType()==1?"uploadSell":"uploadAsk";
        ModelAndView mav = new ModelAndView(path);
        Map<Integer,String> categories = categoryService.listByMap();
        mav.addObject("categories",categories);
        return mav;
    }

    @RequestMapping("/goBookStore.do")
    public ModelAndView goBookStore(Page page,Category category){
        ModelAndView mav = new ModelAndView("bookStore");
        Map<Integer, String> categories = categoryService.listByMap();
        Category curCategory = category.getId() !=0?categoryService.get(category.getId()):new Category();
        String categoryName = curCategory.getName() == null?"所有二手书":curCategory.getName();
        int total = bookService.count();
        page.calculateEnd(total);
        if (page.getStart() < 0) {
            page.setStart(0);
        }else if (page.getStart() > total){
            page.setEnd(page.getEnd());
        }
        PageHelper.offsetPage(page.getStart(),16);
        List<Book> books = curCategory.getId() == 0?bookService.listByBookType(1):bookService.listByCategoryId(1,curCategory.getId());
        mav.addObject("categoryName",categoryName);
        mav.addObject("books",books);
        mav.addObject("categories",categories);
        return mav;
    }

    @RequestMapping("/goAskBookStore.do")
    public ModelAndView goAskBookStore(Page page){
        ModelAndView mav = new ModelAndView("askBookStore");
        List<Spare> spares = spareDAO.getAllSpare();
        mav.addObject("spare", spares);
        return mav;
    }

    @RequestMapping("/gather_user.do")
    public ModelAndView gatherUser(){
        ModelAndView mav =new ModelAndView("admin/gather_user");
        mav.addObject("pageName","用户管理");
        return mav;
    }

    @RequestMapping("/gather_book.do")
    public ModelAndView gatherBook(){
        ModelAndView mav =new ModelAndView("admin/gather_book");
        mav.addObject("pageName","书籍管理");
        return mav;
    }

    @RequestMapping("/gather_spare.do")
    public ModelAndView gatherSpare(){
        ModelAndView mav =new ModelAndView("admin/gather_spare");
        mav.addObject("pageName","闲置物管理");
        return mav;
    }

    @RequestMapping("/gather_order.do")
    public ModelAndView gatherOrder(){
        ModelAndView mav =new ModelAndView("admin/gather_order");
        mav.addObject("pageName","订单管理");
        return mav;
    }

    @RequestMapping("/new_spare.do")
    public ModelAndView newSpare(Spare s, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("askBookStore");
        List<Spare> spares = spareDAO.getAllSpare();
        mav.addObject("spare", spares);

        User u = (User) request.getSession().getAttribute("user");
        if (u != null) {
            s.setUid(u.getId());
            spareDAO.insertSpare(s);
        }
        return mav;
    }

}
