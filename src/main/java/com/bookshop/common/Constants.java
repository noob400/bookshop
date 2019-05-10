package com.bookshop.common;

import java.util.HashMap;

/**
 * Created by 13 on 2017/6/26.
 */
public class Constants {

    public static final int RESULT_CODE_SUCCESS = 200;  // 成功处理请求
    public static final int RESULT_CODE_BAD_REQUEST = 412;  // bad request
    public static final int RESULT_CODE_SERVER_ERROR = 500;  // 没有对应结果
    public static final HashMap<String,String> MENU_SLIDE_BAR = new HashMap<String, String>(){
        {
            put("用户管理","dashboard.do");
            put("二手书管理","gather_book.do");
            put("闲置物管理","gather_spare.do");
            put("订单管理","gather_order.do");
        }
    };
}
