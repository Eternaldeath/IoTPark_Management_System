package com.www.utils;


import com.www.domain.ParkOneInfo;

import java.util.List;

public class CalLotNum {
    public static int normalLot(List<ParkOneInfo> parkOneInfos){
        int normalLot=0;
        for (ParkOneInfo list:parkOneInfos) {
            if(list.getId()<11&&list.getFlag()==1){
                normalLot++;
            }
        }

        return normalLot;
    }

    public static int vipLot(List<ParkOneInfo> parkOneInfos){
        int vipLot=0;
        for (ParkOneInfo list:parkOneInfos) {
            if(list.getId()>10&&list.getFlag()==1){
                vipLot++;
            }
        }

        return vipLot;
    }
}
