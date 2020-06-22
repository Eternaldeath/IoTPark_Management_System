package com.www.dao;

import com.www.domain.Income;
import com.www.domain.Order;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository("iIncomeDao")
public interface IIncomeDao {
    // 查询收入表
    @Select("SELECT * FROM income")
    List<Income> findIncome();

    // 查询进 7 天总收入
    @Select("SELECT totalIncome FROM income WHERE `curdate` " +
            "BETWEEN DATE_SUB(CURDATE(),INTERVAL 7 DAY) AND CURDATE()")
    List<Date> sumIncome();

    // 查询当天收入
    @Select("SELECT * FROM income WHERE `curdate` = CURDATE();")
    Income curIncomeInfo();

    // 更新总收入
    @Update("update income set totalIncome = #{income.totalIncome},curIncome = #{income.curIncome}," +
            "parkOneIncome = #{income.parkOneIncome},parkTwoIncome = #{income.parkTwoIncome},parkThreeIncome = #{income.parkThreeIncome}," +
            "normalIncome = #{income.normalIncome},vipIncome = #{income.vipIncome} where `curdate` = CURDATE();")
    int updateIncome(@Param("income") Income income);
}
