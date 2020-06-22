package com.www.service;

import com.www.domain.Recharge;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

public interface IReChargeService {
    // 查询某人所有账单
    List<Recharge> myRecharge(String nickname);

    // 插入一条充值信息

    int insertRecharge(String nickname, int recharge,int payMethod);
}

