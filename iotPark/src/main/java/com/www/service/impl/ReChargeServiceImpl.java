package com.www.service.impl;

import com.www.dao.IRecharge;
import com.www.domain.Recharge;
import com.www.service.IReChargeService;
import com.www.utils.DateBeau;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service("reChargeServiceImpl")
public class ReChargeServiceImpl implements IReChargeService {
    @Autowired
    private IRecharge iRecharge;


    @Override
    public List<Recharge> myRecharge(String nickname) {
        System.out.println("服务层："+iRecharge.myRecharge(nickname));
        return iRecharge.myRecharge(nickname);
    }

    @Override
    public int insertRecharge(String nickname, int recharge, int payMethod) {
        // 获取当前时间
        Date rechargeTime = new Date(new java.util.Date().getTime());

        //test
        System.out.println(nickname+" "+recharge+" "+payMethod+" "+rechargeTime);

        int i = iRecharge.insertRecharge(nickname, recharge, rechargeTime, payMethod);

        if(i==1){
            return 1;
        }else {
            return 0;
        }
    }
}
