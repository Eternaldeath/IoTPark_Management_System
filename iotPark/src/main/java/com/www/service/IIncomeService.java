package com.www.service;

import com.www.domain.Income;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

public interface IIncomeService {
    // 查询收入表
    List<Income> findIncome();

    // 查询进 7 天总收入
    List<Date> sumIncome();

    // 查询当天收入
    Income curIncomeInfo();

    // 更新总收入
    int updateIncome(Income income);
}
