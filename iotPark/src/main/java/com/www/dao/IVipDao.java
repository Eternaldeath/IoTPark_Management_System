package com.www.dao;

import com.www.domain.Account;
import com.www.domain.Order;
import com.www.domain.Vip;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;
@Repository("iVipDao")
public interface IVipDao {
        // 查询所有 vip 用户详情(分页查询)
        @Select("SELECT * FROM vip limit #{startPage},#{pageSize}")
        List<Vip> findAllVip(@Param("startPage")int startPage,@Param("pageSize")int pageSize);

        // 查询 vip 用户总数
        @Select("select count(*) from vip")
        int vipNum();

        // 查询某个会员详情(根据vipId）
        @Select("SELECT * FROM vip WHERE id = #{vipId}")
        List<Vip> findOneVip(@Param("vipId")int vipId);

        // 查询某个会员详情(根据昵称）
        @Select("SELECT * FROM vip WHERE nickname = #{nickname}")
        Vip findOneVipByNickName(@Param("nickname")String nickname);

        // 根据昵称和密码查询会员（登录）
        @Select("SELECT * FROM vip WHERE nickname = #{nickname} AND PASSWORD = #{password}")
        Vip findOneByPn(@Param("nickname")String nickname,@Param("password")String password);

        // 更新会员数据
        @Select("UPDATE vip SET NAME=#{vip.name},password=#{vip.password},nickname=#{vip.nickname},permission=#{vip.permission},license=#{vip.license},Email=#{vip.email} WHERE id=#{vip.id}")
        void updateVip(@Param("vip") Vip vip);

        // 获取会员的充值账户
        @Select("select * from vipaccount where nickname = #{nickname}")
        Account findAccount(@Param("nickname")String nickname);

        // 更新会员充值账户的金额
        @Update("UPDATE vipaccount SET totalMoney = #{submit_num} WHERE nickname=#{nickname}")
        void updateTotalMoney(@Param("submit_num")int submit_num,@Param("nickname")String nickname);

        // 插入一个会员
        @Insert("insert into vip(name,password,nickname,permission,license,email) values (#{name},#{password},#{nickname},#{permission},#{license},#{email});")
        void insertVip(@Param("name")String name,@Param("password")String password,@Param("nickname")String nickname,@Param("permission")int permission,@Param("license")String license,@Param("email")String email);

        // 插入一个会员账户
        @Insert("insert into vipaccount(vipId,nickname,totalMoney)values(#{vipId},#{nickname},#{totalMoney})")
        void insertVipAccount(@Param("vipId")int vipId,@Param("nickname")String nickname,@Param("totalMoney")int totalMoney);

}
