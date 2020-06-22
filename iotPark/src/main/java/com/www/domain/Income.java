package com.www.domain;

import java.io.Serializable;
import java.util.Date;

public class Income implements Serializable {
    private int id;
    private int totalIncome;
    private Date curdate;
    private int curIncome;
    private int parkOneIncome;
    private int parkTwoIncome;
    private int parkThreeIncome;
    private int normalIncome;
    private int vipIncome;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTotalIncome() {
        return totalIncome;
    }

    public void setTotalIncome(int totalIncome) {
        this.totalIncome = totalIncome;
    }

    public Date getCurdate() {
        return curdate;
    }

    public void setCurdate(Date curdate) {
        this.curdate = curdate;
    }

    public int getCurIncome() {
        return curIncome;
    }

    public void setCurIncome(int curIncome) {
        this.curIncome = curIncome;
    }

    public int getParkOneIncome() {
        return parkOneIncome;
    }

    public void setParkOneIncome(int parkOneIncome) {
        this.parkOneIncome = parkOneIncome;
    }

    public int getParkTwoIncome() {
        return parkTwoIncome;
    }

    public void setParkTwoIncome(int parkTwoIncome) {
        this.parkTwoIncome = parkTwoIncome;
    }

    public int getParkThreeIncome() {
        return parkThreeIncome;
    }

    public void setParkThreeIncome(int parkThreeIncome) {
        this.parkThreeIncome = parkThreeIncome;
    }

    public int getNormalIncome() {
        return normalIncome;
    }

    public void setNormalIncome(int normalIncome) {
        this.normalIncome = normalIncome;
    }

    public int getVipIncome() {
        return vipIncome;
    }

    public void setVipIncome(int vipIncome) {
        this.vipIncome = vipIncome;
    }


    @Override
    public String toString() {
        return "Income{" +
                "id=" + id +
                ", totalIncome=" + totalIncome +
                ", curdate=" + curdate +
                ", curIncome=" + curIncome +
                ", parkOneIncome=" + parkOneIncome +
                ", parkTwoIncome=" + parkTwoIncome +
                ", parkThreeIncome=" + parkThreeIncome +
                ", normalIncome=" + normalIncome +
                ", vipIncome=" + vipIncome +
                '}';
    }
}
