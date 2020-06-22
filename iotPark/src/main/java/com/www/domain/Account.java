package com.www.domain;

import java.io.Serializable;

public class Account implements Serializable {
    private int id;
    private int vipId;
    private String nickname;
    private int totalMoney;

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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", vipId=" + vipId +
                ", nickname='" + nickname + '\'' +
                ", totalMoney=" + totalMoney +
                '}';
    }
}
