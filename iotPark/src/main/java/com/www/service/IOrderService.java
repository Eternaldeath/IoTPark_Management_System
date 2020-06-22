package com.www.service;

import com.www.dao.IOrderDao;
import com.www.domain.Order;
import com.www.domain.Vip;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.sql.Date;
import java.util.List;

public interface IOrderService {
    // 查询当前订单详情
    List<Order> findAllCurOrder();

    // 查询所有订单数
    int findAllOrderNum();

    // 查询所有订单
    List<Order> findAllOrder();

    // 查询某人的订单详情
    List<Order> findMyOrder(int vipId);

    // 查询某人的订单详情(通过vipId)
    List<Order> findMyOrderByNick(int vipId);

    // 查询某人的可用订单
    int findEntailOrder(int vipId);

    // 查询某人的订单数
    int findAllOrderNumInOne(@Param("vipId") int vipId);

    // 删除订单
    void deletOrder(int vipId);

    // 插入一个订单
    int insertOrder(int vipId, java.util.Date startTime, java.util.Date scheduledTime, java.util.Date deadTime
            , int parkNum, int parkLotNum, int orderValid, int orderFee);

    // 查询某人的当前订单
    int findOrderByValidAndId(int vipId);

    // 停车后的信息修改
    // 停车后，修改某人的停车信息
    void changeOrderValid(int vipId);

    void changeIsOrder(String license);

    // 查询用户订单(分页查询)
    List<Order> findOneVipOrder(int startPage, int pageSize, int vipId);
}
