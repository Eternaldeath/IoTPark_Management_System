package com.www.service.impl;

import com.www.dao.IIncomeDao;
import com.www.domain.Income;
import com.www.service.IIncomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("IncomeServiceImpl")
public class IncomeServiceImpl implements IIncomeService {
    @Autowired
    private IIncomeDao iIncomeDao;

    @Override
    // 查询所有营收信息
    public List<Income> findIncome() {
        return iIncomeDao.findIncome();
    }

    @Override
    public List<Date> sumIncome() {
        return iIncomeDao.sumIncome();
    }

    @Override
    public Income curIncomeInfo() {
        return iIncomeDao.curIncomeInfo();
    }

    @Override
    public int updateIncome(Income income) {
        return iIncomeDao.updateIncome(income);
    }


}
