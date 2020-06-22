package com.www.domain;

import java.io.Serializable;

public class ParkAllInfo implements Serializable {
    private int id;
    private String parkallName;
    private int allLot;
    private int normalLot;
    private int vipLot;
    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getParkallName() {
        return parkallName;
    }

    public void setParkallName(String parkallName) {
        this.parkallName = parkallName;
    }

    public int getAllLot() {
        return allLot;
    }

    public void setAllLot(int allLot) {
        this.allLot = allLot;
    }

    public int getNormalLot() {
        return normalLot;
    }

    public void setNormalLot(int normalLot) {
        this.normalLot = normalLot;
    }

    public int getVipLot() {
        return vipLot;
    }

    public void setVipLot(int vipLot) {
        this.vipLot = vipLot;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ParkAllInfo{" +
                "id=" + id +
                ", parkallName='" + parkallName + '\'' +
                ", allLot=" + allLot +
                ", normalLot=" + normalLot +
                ", vipLot=" + vipLot +
                ", status=" + status +
                '}';
    }
}
