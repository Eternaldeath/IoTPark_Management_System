package com.www.domain;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Recharge implements Serializable {
    private int billId;
    private String nickname;
    private int recharge;
    private Date recharegeTime;
    private int payMethod;

    public int getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(int payMethod) {
        this.payMethod = payMethod;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getRecharge() {
        return recharge;
    }

    public void setRecharge(int recharge) {
        this.recharge = recharge;
    }

    public String getRecharegeTime() {
        return new SimpleDateFormat("yyyy年MM月dd日").format(recharegeTime);
    }

    public void setRecharegeTime(Date recharegeTime) {
        this.recharegeTime = recharegeTime;
    }

    @Override
    public String toString() {
        return "Recharge{" +
                "billId=" + billId +
                ", nickname='" + nickname + '\'' +
                ", recharge=" + recharge +
                ", recharegeTime=" + recharegeTime +
                ", payMethod=" + payMethod +
                '}';
    }
}
