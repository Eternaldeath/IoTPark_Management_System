package com.www.service;

import com.www.domain.ParkAllInfo;
import com.www.domain.ParkOneInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import java.util.Date;
import java.util.List;

public interface IParkService {
    // 查询该停车场所有停车信息
    // 传入要查询的停车场
    List<ParkOneInfo> parkOneInfo();

    // 查询所有停车场信息
    List<ParkAllInfo> parkAllInfo();

    // 更新一号停车场信息
    void updateParkOneInfo(String license,int isOrder, Date orderDate, int parkLotNum);


    // 更新停车场 flag 标志位与车牌号
    void updateParkLog(int id, String license);

    // 更新停车场 flag 标志位
    void updateParkLot(int id);

    // 车主离开后修改 flag 标志位
    void removeParkLog(int id);

    // 车主离开后修改 flag 标志位(根据车牌号来完成)
    void removeParkLotByLisence(String license);

}
