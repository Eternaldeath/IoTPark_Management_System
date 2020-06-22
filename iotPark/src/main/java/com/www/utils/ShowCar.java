package com.www.utils;

import com.www.domain.ParkOneInfo;
import com.www.service.IOrderService;
import com.www.service.impl.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ShowCar {
    @Autowired
    private OrderServiceImpl orderService;
    // 显示车位
    public static int[] showCarOnPark(List<ParkOneInfo> parkOneInfoList){
        int showPark[] = new int[20];
        int i=0;
        for (ParkOneInfo parkCars:parkOneInfoList) {
            if(parkCars.getFlag()==1){
                // 如果 flag 标志位为 1，表明当前有车辆在停
                showPark[i]=1;
            }
            if(parkCars.getIsOrder()==1){
                // 表明当前车位已经被预定了
                showPark[i]=2;
            }
            i++;
        }

        return showPark;
    }

    // 预定车位
    public static int[] showOrderCar(List<ParkOneInfo> parkOneInfoList){
        int showPark[] = new int[20];
        int i=0;
        for (ParkOneInfo parkCars:parkOneInfoList) {
            if(parkCars.getFlag()==0&&parkCars.getIsOrder()==0&&i>9){
                // 如果 flag 标志位为 0，表明当前车位无车
                // isOrder 为 0 表明当前车位无人预定
                showPark[i]=1;
            }
            i++;
        }

        return showPark;
    }
}
