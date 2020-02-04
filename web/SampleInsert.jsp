<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : SampleInsert
    Created on : Jan 29, 2020, 9:04:57 PM
    Author     : 62542
--%>
<%@page import="java.sql.*" %>
<%@page import="org.sqlite.*" %>
<% 
    String DB_NAME="hello-todo.db";
    String DB_PATH ="jdbc:sqlite:d:\\62542\\My Documents\\db\\";
    String CONNECTION_STR = DB_PATH + DB_NAME ;
    out.print(CONNECTION_STR);
    String INSERT = "INSERT INTO Sample(sampleName, sampleValue) VALUES"
            + " (?,?)";
    
    
    String insert = request.getParameter("insert");
    String message = "Lütfen bilgileri giriniz";
    if(insert!= null) {
        String sampleName = request.getParameter("sampleName");        
        double sampleValue = Double.parseDouble(request.getParameter("sampleValue"));
        message = "\nÖrnek Eklendi "+sampleName+" "+sampleValue;
        
        Class.forName("org.sqlite.JDBC"); //bunu koymadan çalışmıyor neden çözemedim :D
        // Ayrıntılı oku -- > http://www.xyzws.com/Javafaq/what-does-classforname-method-do/17
        
        Connection connection = DriverManager.getConnection(CONNECTION_STR,"","");
        
        PreparedStatement stmt = connection.prepareStatement(INSERT);
        stmt.setString(1, sampleName);
        stmt.setDouble(2, sampleValue);
        int affected = stmt.executeUpdate();
        message = "Etkilenen satır say : " + affected;
            
        connection.close();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Örnek ekleme</title>
    </head>
    <body>
        <h1>Örnek ekleme sayfası!</h1>
        <i><%= message %></i>
        <form method="POST" action="SampleInsert.jsp">
            <label>Örnek adı</label>
            <input type="text" name="sampleName" value="" /></br>
            <label>Örnek değeri</label>
            <input type="text" name="sampleValue" value="" /></br>
            <input type="submit" value="Kaydet" name="insert" /></br>
        </form>
        
    </body>
</html>
