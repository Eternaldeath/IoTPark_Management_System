package com.www.dao;

import com.www.domain.Admin;
import com.www.domain.Order;
import com.www.domain.Vip;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.junit.Test;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Repository("iOrderDao")
public interface IOrderDao {
    // 查询当前订单详情
    @Select("SELECT * FROM orderTable WHERE orderValid = 1")
    List<Order> findAllCurOrder();

    //查询所有订单数
    @Select("SELECT count(*) FROM orderTable")
    int findAllOrderNum();

    // 查询某人的订单数
    @Select("SELECT count(*) FROM orderTable where vipId=#{vipId}")
    int findAllOrderNumInOne(@Param("vipId") int vipId);

    // 查询所有订单
    @Select("SELECT * FROM ordertable")
    List<Order> findAllOrder();

    // 查询某人的订单详情(通过vipId)
    @Select("select * from ordertable where vipid=#{vipId}")
    List<Order> findMyOrder(@Param("vipId")int vipId);

    // 查询某人的订单详情(通过昵称)
    @Select("select * from ordertable where nickname=#{nickname}")
    List<Order> findMyOrderByNick(@Param("nickname")String nickname);

    // 查询某人的可用订单
    @Select("SELECT parkLotNum FROM ordertable WHERE  orderValid = 1 AND vipId = #{vipId}")
    int findEntailOrder(@Param("vipId")int vipId);

    // 删除订单
    @Select("delete from ordertable where vipId=#{vipId}")
    void deletOrder(@Param("vipId")int vipId);

    // 插入一个订单
    @Insert("insert into ordertable(vipId,startTime,scheduledTime,deadTime,parkNum,parkLotNum,orderValid,orderFee) " +
            "values (#{vipId},#{startTime},#{scheduledTime},#{deadTime},#{parkNum},#{parkLotNum},#{orderValid},#{orderFee});")
    int insertOrder(@Param("vipId") int vipId, @Param("startTime") java.util.Date startTime, @Param("scheduledTime") java.util.Date  scheduledTime, @Param("deadTime")java.util.Date  deadTime
            , @Param("parkNum")int parkNum, @Param("parkLotNum")int parkLotNum, @Param("orderValid")int orderValid, @Param("orderFee")int orderFee);

    // 查询某人的当前订单
    @Select("select count(*) from ordertable where orderValid=1 and vipId=#{vipId}")
    int findOrderByValidAndId(@Param("vipId") int vipId);

    // 停车后，取消订单
    @Update("UPDATE ordertable SET orderValid = 0,deadTime = curdate() WHERE vipId=#{vipId}")
    void changeOrderValid(@Param("vipId") int vipId);

    @Update("UPDATE parkoneinfo SET isOrder = 0 WHERE license = #{license}")
    void changeIsOrder(@Param("license")String license);

    // 查询用户订单(分页查询)
    @Select("SELECT * FROM ordertable where vipId = #{vipId} limit #{startPage},#{pageSize} ")
    List<Order> findOneVipOrder(@Param("startPage")int startPage, @Param("pageSize")int pageSize,@Param("vipId")int vipId);
}
