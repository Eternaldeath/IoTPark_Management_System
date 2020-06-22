package com.www.service.impl;


import com.www.dao.IAdminDao;
import com.www.domain.Admin;
import com.www.service.IloginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginService")
public class loginSercie implements IloginService {
    @Autowired
    private IAdminDao iAdminDao;



    @Override
    // 验证管理员账户权限
    public int VeriAdmini(String nickname, String password) {
        Admin admin = iAdminDao.findOneAdmin(nickname,password);
        if(admin!=null){
            return 1;
        }
        else {
            return 0;
        }
    }

    @Override
    // 查询当前订单数量
    public int findCurOrderNum() {
        return iAdminDao.findCurOrderNum();
    }

    @Override
    // 查询会员数量
    public int findVipNum() {
        System.out.println("服务层会员数量"+iAdminDao.findVipNum());
        return iAdminDao.findVipNum();
    }


}
