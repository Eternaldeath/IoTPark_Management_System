package com.www.test;

import com.www.domain.Admin;
import com.www.domain.Order;

import javax.swing.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {
    @org.junit.Test
    public void query() {
        Date date = new Date();
        System.out.println(date);
        SimpleDateFormat dateFormat = new SimpleDateFormat();
        System.out.println(dateFormat);
    }

}

