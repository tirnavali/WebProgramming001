/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sercan.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 62542
 */
public class SampleManager {
    
    String DB_NAME="hello-todo.db";
    String DB_PATH ="jdbc:sqlite:d:\\62542\\My Documents\\db\\";
    String CONNECTION_STR = DB_PATH + DB_NAME ;
    String TABLE_NAME = "Sample";
    String TABLE_COL_ID = "sampleId";
    String TABLE_COL_NAME = "sampleName";
    String TABLE_COL_VAL = "sampleValue";
    String SELECT_ALL = "SELECT * FROM "+ TABLE_NAME;
    
    String INSERT = "INSERT INTO Sample(sampleName, sampleValue) VALUES"
            + " (?,?)";
    String FIND = "SELECT * FROM "+TABLE_NAME+" WHERE "+TABLE_COL_ID+" = ? ";
    
    public Sample find(long sampleId) throws Exception {
        Sample sample = null;
        Connection connection = DriverManager.getConnection(CONNECTION_STR, "", "");

        PreparedStatement stmt = connection.prepareStatement(FIND);
        stmt.setLong(1, sampleId);
        
        ResultSet rs = stmt.executeQuery();
        if(rs.next()) {
            sample.setSampleName(rs.getString(TABLE_COL_NAME));
            sample.setSampleValue(rs.getDouble(TABLE_COL_VAL));
            sample.setSampleId(sampleId);
        } 

        return sample;
    }
    
    public boolean insert(Sample sample) throws Exception {
        
    
    
    Class.forName("org.sqlite.JDBC"); //bunu koymadan çalışmıyor neden çözemedim :D
        // Ayrıntılı oku -- > http://www.xyzws.com/Javafaq/what-does-classforname-method-do/17
        
    Connection connection = DriverManager.getConnection(CONNECTION_STR, "", "");

    PreparedStatement stmt = connection.prepareStatement(INSERT);
    stmt.setString(1, sample.getSampleName());
    stmt.setDouble(2, sample.getSampleValue());
    int affected = stmt.executeUpdate();
    

    connection.close();
    
    return affected > 0;
        
    }   
    
    public List<Sample> list() throws Exception{
        List<Sample> sampleList = new ArrayList<Sample>();
        Class.forName("org.sqlite.JDBC");
        Connection connection = DriverManager.getConnection(CONNECTION_STR, "", "");
        PreparedStatement stmt = connection.prepareStatement(SELECT_ALL);
    
        ResultSet rs =  stmt.executeQuery();
        
        while(rs.next()){
            Sample sample = new Sample();
            sample.setSampleId(rs.getLong(TABLE_COL_ID));
            sample.setSampleName(rs.getString(TABLE_COL_NAME));
            sample.setSampleValue(rs.getDouble(TABLE_COL_VAL));
            
            sampleList.add(sample);            
        }      

        connection.close();        
        return sampleList;
    }
}
