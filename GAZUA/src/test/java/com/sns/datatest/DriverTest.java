package com.sns.datatest;


import java.sql.*;

public class DriverTest {
 
 public static void main(String args[]) {

     try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection conn = DriverManager.getConnection(
                 "jdbc:mysql://127.0.0.1:3306/ctrlf11", "BaeNuri", "clftjdtkdlek77!");
         System.out.println("Success!");
     } catch (SQLException ex) {
         System.out.println("SQLException:" + ex);
     } catch (Exception e) {
         System.out.println("Exception:" + e);
     }
 }
}


