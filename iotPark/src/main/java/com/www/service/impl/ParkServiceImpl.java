package com.www.service.impl;


import com.www.dao.IParkInfoDao;
import com.www.domain.ParkAllInfo;
import com.www.domain.ParkOneInfo;
import com.www.service.IParkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("parkServiceImpl")
public class ParkServiceImpl implements IParkService {

    @Autowired
    private IParkInfoDao iParkInfoDao;


    @Override
    public List<ParkOneInfo> parkOneInfo() {
        return iParkInfoDao.parkOneInfo();
    }

    @Override
    public List<ParkAllInfo> parkAllInfo() {
        return iParkInfoDao.parkAllInfo();
    }

    @Override
    public void updateParkOneInfo(String license, int isOrder, Date orderDate, int parkLotNum) {
        iParkInfoDao.updateParkOneInfo(license, isOrder, orderDate, parkLotNum);
    }


    @Override
    public void updateParkLog(int id, String license) {
        iParkInfoDao.updateParkLog(id, license);
    }

    @Override
    public void updateParkLot(int id) {
        iParkInfoDao.updateParkLot(id);
    }

    @Override
    public void removeParkLog(int id) {
        iParkInfoDao.removeParkLog(id);
    }

    @Override
    public void removeParkLotByLisence(String license) {
        iParkInfoDao.removeParkLotByLisence(license);
    }
}
