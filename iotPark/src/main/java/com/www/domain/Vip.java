package com.www.domain;

import org.springframework.stereotype.Service;

import java.io.Serializable;

public class Vip implements Serializable {
    private int id;
    private String name;
    private String password;
    private String nickname;
    private int permission;
    private String license;
    private String email;


    public Vip() {
    }

    public Vip(int id, String name, String password, String nickname, int permission, String license, String email) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.nickname = nickname;
        this.permission = permission;
        this.license = license;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Vip{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", permission=" + permission +
                ", license='" + license + '\'' +
                ", Email='" + email + '\'' +
                '}';
    }
}

