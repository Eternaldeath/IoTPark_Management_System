package com.www.dao;

import com.www.domain.Recharge;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

// 对账单进行操作
@Repository("iRecharge")
public interface IRecharge {
    // 查询某人的所有账单
    @Select("select * from userbill where nickname = #{nickname}")
    List<Recharge> myRecharge(@Param("nickname")String nickname);

    // 插入一条充值信息
    @Insert("insert into userbill(nickname,recharge,recharegeTime,payMethod) values (#{nickname},#{recharge},#{rechargeTime},#{payMethod});")
    int insertRecharge(@Param("nickname") String nickname, @Param("recharge")int recharge, @Param("rechargeTime") Date rechargeTime, @Param("payMethod")int payMethod);
}
