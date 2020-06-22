package com.www.domain;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Order implements Serializable {
    private int id;
    private int vipId;
    private Date startTime;
    private Date scheduledTime;
    private Date deadTime;
    private int parkNum;
    private int parkLotNum;
    private int orderValid;
    private int orderFee;

    public Order() {
    }

    public Order(Date startTime, Date scheduleTime, Date deadTime) {
        this.startTime = startTime;
        this.scheduledTime = scheduleTime;
        this.deadTime = deadTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVipId() {
        return vipId;
    }

    public void setVipId(int vipId) {
        this.vipId = vipId;
    }

    public String  getStartTime() {
        return new SimpleDateFormat("yyyy年MM月dd日").format(startTime);
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getScheduledTime() {
        return new SimpleDateFormat("yyyy年MM月dd日").format(scheduledTime);
    }

    public void setScheduledTime(Date scheduledTime) {
        this.scheduledTime = scheduledTime;
    }

    public String getDeadTime() {
        if(deadTime==null){
            return null;
        }
        return new SimpleDateFormat("yyyy年MM月dd日").format(deadTime);
    }

    public void setDeadTime(Date deadTime) {
        this.deadTime = deadTime;
    }

    public int getParkNum() {
        return parkNum;
    }

    public void setParkNum(int parkNum) {
        this.parkNum = parkNum;
    }

    public int getParkLotNum() {
        return parkLotNum;
    }

    public void setParkLotNum(int parkLotNum) {
        this.parkLotNum = parkLotNum;
    }

    public int getOrderValid() {
        return orderValid;
    }

    public void setOrderValid(int orderValid) {
        this.orderValid = orderValid;
    }

    public int getOrderFee() {
        return orderFee;
    }

    public void setOrderFee(int orderFee) {
        this.orderFee = orderFee;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", vipId=" + vipId +
                ", startTime=" + startTime +
                ", scheduleTime=" + scheduledTime +
                ", deadTime=" + deadTime +
                ", parkNum=" + parkNum +
                ", parkLotNum=" + parkLotNum +
                ", orderValid=" + orderValid +
                ", orderFee=" + orderFee +
                '}';
    }
}
