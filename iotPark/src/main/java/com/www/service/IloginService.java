package com.www.service;

public interface IloginService {
    // 验证管理员身份
    int VeriAdmini(String nickname,String password);

    // 查询当前订单数量
    int findCurOrderNum();

    // 查询会员数量
    int findVipNum();
}
