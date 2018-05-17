package com.sns.datatest;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {

   private static final String DRIVER = 
         "com.mysql.cj.jdbc.Driver";
   private static final String URL = 
         "jdbc:mysql://ctrlf11.cqfwljmig7zs.ap-northeast-2.rds.amazonaws.com";
   private static final String USER = 
         "BaeNuri";
   private static final String PW = 
         "clftjdtkdlek77!";
         
   
   @Test
   public void testConnection() throws Exception{
      
      Class.forName(DRIVER);
      
      try(Connection con = DriverManager.getConnection(URL, USER, PW)){
         
         System.out.println(con);
         
         
      }catch(Exception e){
         e.printStackTrace();
      }
   }
}