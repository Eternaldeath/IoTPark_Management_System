package com.www.dao;

import com.www.domain.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("iAdminDao")
public interface IAdminDao {
    // 查询所有管理员
    @Select("select * from administer")
    List<Admin> findAllAdmin();

    // 查询一个管理员
    // @Param("nickname") 用于标识传过来的参数作为 #{nickname} 的值
    @Select("select * from administer where nickname=#{nickname} and password=#{password}")
    Admin findOneAdmin(@Param("nickname") String nickname, @Param("password")String password);

    // 查询当前订单数量
    @Select("SELECT COUNT(*) FROM orderTable WHERE orderValid = 1")
    int findCurOrderNum();

    // 查询会员的数量
    @Select("SELECT COUNT(*) FROM vip")
    int findVipNum();


}
