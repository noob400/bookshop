package com.bookshop.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录认证的拦截器
 */
public class LoginInterceptor implements HandlerInterceptor{

    /**
     * Handler执行完成之后调用这个方法
     */
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception exc)
            throws Exception {

    }

    /**
     * Handler执行之后，ModelAndView返回之前调用这个方法
     */
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {
    }

    /**
     * Handler执行之前调用这个方法
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        //获取请求的URL
        String url = request.getRequestURI();
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        if(url.contains("/users")){
            if (url.contains("/users/sessions") || url.contains("/users/checkSignIn")) {
                return true;
            }

            if (request.getSession().getAttribute("user") != null) {
                return true;
            }

            //不符合条件的，跳转到登录界面
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);

            return false;
        }else if(url.contains("/admin")){
            // 如果是管理员登录则直接放行
            if(url.contains("checkLogin")){
                return true;
            }

            // 否则根据是否登录进行拦截
            if(request.getSession().getAttribute("admin")!=null){
                return true;
            }

            request.setAttribute("mode","admin");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return false;
        }
        return true;
    }

}


