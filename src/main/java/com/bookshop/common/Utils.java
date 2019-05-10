package com.bookshop.common;

import java.util.HashMap;
import java.util.Map;

public class Utils {
    public static HashMap<String,String> getStrippedRequestParams(Map<String, String[]> m){
        HashMap<String,String> res = new HashMap<>();
        m.forEach((a,b)->{
            int start = a.lastIndexOf('[')+1;
            int end = a.lastIndexOf(']');
            // Only accept one value in values field
            if(start<end && b.length==1){
                String key = a.substring(start,end);
                String value = b[0];
                res.put(key,value);
            }
        });
        return res;
    }
}
