/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.irko.dao;

/**
 *
 * @author Torus
 */
public class Constants {
    public static String DRIVER = "com.mysql.jdbc.Driver";
    public static String URL = "jdbc:mysql://localhost/irko?useUnicode=true&characterEncoding=utf-8";
    public static String DB_USERNAME = "root";
    public static String DB_PASSWORD = "7777";
    
    public static int NO_ERROR = 0;
    public static int INVALID_PASSWORD_ERROR = 2;
    public static int INVALID_MAILID_ERROR = 1;
    
    public static String[] FIELDS= {"bookName","image","author","category","price","count(*) as c"};
    
    
}
