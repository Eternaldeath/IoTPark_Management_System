package com.www.utils;

public class PerChange {
    public  static int PerchangePer(String permission){
        System.out.println("在改变工具类中检查："+permission);
        if(permission.equals("会员用户")){
            return 2;
        }
        return 0;
    }
}
