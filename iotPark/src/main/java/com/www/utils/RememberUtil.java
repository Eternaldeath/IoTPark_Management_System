package com.www.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class RememberUtil {
    public static void rememberCookie(String nickName,String password,HttpServletResponse response) throws UnsupportedEncodingException {
        Cookie cookieNameAndPwd = new Cookie("nickNameAndPwd",nickName+"#"+password);

        // 设置一周的过期时间
        cookieNameAndPwd.setMaxAge(60*60*24*365);

        // 设置访问路径
        cookieNameAndPwd.setPath("/");

        response.addCookie(cookieNameAndPwd);
        System.out.println("cookie 设置成功");
    }
}
