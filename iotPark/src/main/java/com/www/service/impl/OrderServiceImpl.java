package com.www.service.impl;

import com.www.dao.IAdminDao;
import com.www.dao.IOrderDao;
import com.www.domain.Order;
import com.www.service.IOrderService;
import com.www.utils.DateBeau;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service("orderServiceImpl")
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private IOrderDao iOrderDao;


    @Override
    // 查询当前订单详情
    public List<Order> findAllCurOrder() {
        List<Order> curorderService = iOrderDao.findAllCurOrder();
        return iOrderDao.findAllCurOrder();
    }

    @Override
    // 查询所有订单数
    public int findAllOrderNum() {
        return iOrderDao.findAllOrderNum();
    }

    // 查询所有订单
    @Override
    public List<Order> findAllOrder() {
        return iOrderDao.findAllOrder();
    }

    // 查询我的订单
    @Override
    public List<Order> findMyOrder(int vipId) {
        return iOrderDao.findMyOrder(vipId);
    }

    @Override
    public List<Order> findMyOrderByNick(int vipId) {
        return iOrderDao.findMyOrder(vipId);
    }

    @Override
    public int findEntailOrder(int vipId) {
        return iOrderDao.findEntailOrder(vipId);
    }

    @Override
    public int findAllOrderNumInOne(int vipId) {
        return iOrderDao.findAllOrderNumInOne(vipId);
    }

    // 删除订单
    @Override
    public void deletOrder(int vipId) {
         iOrderDao.deletOrder(vipId);
    }

    @Override
    public int insertOrder(int vipId, java.util.Date startTime, java.util.Date scheduledTime, java.util.Date deadTime, int parkNum, int parkLotNum, int orderValid, int orderFee) {
        return iOrderDao.insertOrder(vipId, startTime, scheduledTime, deadTime, parkNum, parkLotNum, orderValid, orderFee);
    }

    @Override
    public int findOrderByValidAndId(int vipId) {
        return iOrderDao.findOrderByValidAndId(vipId);
    }

    @Override
    public void changeOrderValid(int vipId) {
        iOrderDao.changeOrderValid(vipId);
    }

    @Override
    public void changeIsOrder(String license) {
        iOrderDao.changeIsOrder(license);
    }

    @Override
    public List<Order> findOneVipOrder(int startPage, int pageSize, int vipId) {
        return iOrderDao.findOneVipOrder(startPage, pageSize, vipId);
    }

}
