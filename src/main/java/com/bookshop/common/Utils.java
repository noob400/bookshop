package com.bookshop.common;

import com.bookshop.pojo.User;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

public class Utils {
    public static HashMap<String,String> getRequestMap(Map<String, String[]> m){
        HashMap<String,String> d = new HashMap<>();
        m.forEach((a,b)->{
            if(b.length>=1){
                d.put(a,b[0]);
            }
        });
        return d;
    }

    public static <T> T fillObjectFromMap(T u,HashMap<String,String> m){
        Field[] fs = u.getClass().getDeclaredFields();
        try {
            for (Field f : fs) {
                f.setAccessible(true);
                if(f.getType().equals(String.class)){
                    f.set(u,m.get(f.getName()));
                } else if(f.getType().equals(char.class) || f.getType().equals(Character.class)){
                    f.set(u,m.get(f.getName()).charAt(0));
                } else if(f.getType().equals(double.class) || f.getType().equals(Double.class)){
                    f.set(u,Double.parseDouble(m.get(f.getName())));
                }else if(f.getType().equals(int.class) || f.getType().equals(Integer.class)){
                    f.set(u,Integer.parseInt(m.get(f.getName())));
                } else if(f.getType().equals(long.class) || f.getType().equals(Long.class)){
                    f.set(u,Long.parseLong(m.get(f.getName())));
                }else{
                    System.out.println("error "+f.getName()+":"+f.getType()+"dont match any type");
                }

            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        System.out.println("Inserting object "+u);
        return u;
    }
}
