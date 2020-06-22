package com.www.test;

import com.www.domain.Order;

import java.sql.*;
import java.util.List;

public class TestVip {

    public static void main(String[] args) throws SQLException {
// TODO Auto-generated method stub
        Connection connection = null;
        Statement statement = null;
        ResultSet resultset = null;
        List<Order> orderList;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/park?serverTimezone=GMT&useUnicode=true&charaterEncoding=utf-8&useSSL=false",
                    "root", "1234");

            statement = connection.createStatement();

            String sqString = "SELECT * FROM vip;";

            // 查询 sql 语句
            resultset = statement.executeQuery(sqString);

            // 遍历
            while (resultset.next()) {
                System.out.println("startTime:"+resultset.getString("name"));

            }
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                if (resultset != null) {
                    resultset.close();
                }

                if (statement != null) {
                    statement.close();
                }

                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }

}

