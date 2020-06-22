package com.www.utils;

import com.www.domain.Order;
import org.junit.Test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class DateBeau {
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
    String startTime;
    String scheduleTime;
    String deadTime;
    List<String> timeList;

    public String bDate(Date date){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
        String newDate = simpleDateFormat.format(date);
        return newDate;
    }

    @Test
    // 获取当前时间
    public static Date getCurDate(){
        Date date = new Date();
//        System.out.println(date);
        return date;
    }

    // 对日期选择器的时间进行转化
    public static Date changePickerTime(String datePicker) throws ParseException {
        datePicker = datePicker.replace("年","-");
//        System.out.println(datePicker);
        datePicker = datePicker.replace("月","-");
        datePicker = datePicker.replace("日","");
//        System.out.println("帮助类的数据"+datePicker);
        // 日期格式转换
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        Date date = fmt.parse(datePicker);

        return date;
    }

//    public List<String> bDataList(List<Order> orders){
//        for (Order order:orders) {
//           startTime = simpleDateFormat.format(order.getStartTime());
//           scheduleTime = simpleDateFormat.format(order.getScheduleTime());
//           deadTime = simpleDateFormat.format(order.getDeadTime());
//
//
//        }
//    }
}
