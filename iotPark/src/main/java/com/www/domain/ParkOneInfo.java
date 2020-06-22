package com.www.domain;

import java.io.Serializable;
import java.util.Date;

public class ParkOneInfo implements Serializable {
    private int id;
    private String license;
    private int flag;
    private int permission;
    private int isOrder;
    private Date orderDate;

    public int getIsOrder() {
        return isOrder;
    }

    public void setIsOrder(int isOrder) {
        this.isOrder = isOrder;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "ParkOneInfo{" +
                "id=" + id +
                ", license='" + license + '\'' +
                ", flag=" + flag +
                ", permission=" + permission +
                ", isOrder=" + isOrder +
                ", orderDate=" + orderDate +
                '}';
    }
}
