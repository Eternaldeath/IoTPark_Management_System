package com.www.service.impl;

import com.www.dao.IVipDao;
import com.www.domain.Account;
import com.www.domain.Vip;
import com.www.service.IVipService;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("vipServiceImpl")
public class VipServiceImpl implements IVipService {

    @Autowired
    private IVipDao iVipDao;

    @Override
    // 查找所有 vip 的详情
    public List<Vip> findAllVip(int startPage,int pageSize) {
        System.out.println("服务层："+iVipDao.findAllVip(startPage,pageSize));
        return iVipDao.findAllVip(startPage,pageSize);
    }

    @Override
    public int vipNum() {
        return iVipDao.vipNum();
    }

    @Override
    public List<Vip> findOneVip(int vipId) {
        return iVipDao.findOneVip(vipId);
    }

    @Override
    public void updateVip(Vip vip) {
        iVipDao.updateVip(vip);
    }

    @Override
    public int findOneByPn(String nickname, String password) {
        Vip result = iVipDao.findOneByPn(nickname,password);
        // 如果返回值是 1 ，表明存在该用户
        if(result!=null){
            return 1;
        }else {
            return 0;
        }
    }

    @Override
    public Vip findOneVipByNickName(String nickname) {
        System.out.println("服务层："+iVipDao.findOneVipByNickName(nickname));
        return iVipDao.findOneVipByNickName(nickname);
    }

    @Override
    public Account findAccount(String nickname) {
        return iVipDao.findAccount(nickname);
    }

    // 更新会员充值账户的金额
    @Override
    public void updateTotalMoney(int submit_num,String nickname) {
        iVipDao.updateTotalMoney(submit_num,nickname);
    }

    @Override
    public void insertVip(String name, String password, String nickname, int permission, String license,String email) {
        iVipDao.insertVip(name, password, nickname, permission, license,email);
    }

    @Override
    public void insertVipAccount(int vipId, String nickname, int totalMoney) {
        iVipDao.insertVipAccount(vipId, nickname, totalMoney);
    }


}
