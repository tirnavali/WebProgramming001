<%@page import="com.sercan.entity.SampleManager"%>
<%@page import="com.sercan.entity.Sample"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : SampleInsert
    Created on : Jan 29, 2020, 9:04:57 PM
    Author     : 62542
--%>

<% 

    String insert = request.getParameter("insert");
    String message = "Lütfen bilgileri giriniz";
    if(insert!= null) {
        String sampleName = request.getParameter("sampleName");        
        double sampleValue = Double.parseDouble(request.getParameter("sampleValue"));
        message = "\nÖrnek Eklendi "+sampleName+" "+sampleValue;
        
        Sample sample = new Sample(0, sampleName, sampleValue);
        SampleManager sampleManager = new SampleManager();
        boolean inserted = sampleManager.insert(sample);
                
        message = "Etkilenen satır ver mı? : " + inserted;
               
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
