package com.www.service;

import com.www.domain.Account;
import com.www.domain.Vip;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IVipService {
    // 查询所有vip信息
    List<Vip> findAllVip(int startPage,int pageSize);

    // 查询 vip 总数
    int vipNum();

    // 查询某个会员详情
    List<Vip> findOneVip(int vipId);

    // 更新会员
    void updateVip(Vip vip);

    // 根据昵称和密码查询会员（登录）
    int findOneByPn(String nickname, String password);

    // 查询某个会员详情(根据昵称）
    Vip findOneVipByNickName(String nickname);

    // 获取会员的充值账户
    Account findAccount(String nickname);

    // 更新会员充值账户的金额
    void updateTotalMoney(int submit_num,String nickname);

    // 插入一个会员
    void insertVip(String name,String password,String nickname,int permission,String license,String email);

    // 插入一个会员账户
    void insertVipAccount(int vipId,String nickname,int totalMoney);


}
