<%-- 
    Document   : SampleList
    Created on : Feb 4, 2020, 3:38:32 PM
    Author     : 62542
--%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sercan.entity.Sample"%>
<%@page import="com.sercan.entity.Sample"%>
<%@page import="com.sercan.entity.SampleManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
      SampleManager sm = new SampleManager();
      List<Sample> mySampleList =  sm.list();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample List</title>
    </head>
    <body>
        <h1>Örnek Listeleme</h1>
         <table border="1">
             <thead>
                 <tr>
                     <td>Örnek ID</td>
                     <td>Örneğin Adı</td>
                     <td>Örneğin Değeri</td>
                 </tr>
             </thead>
             <tbody>
        <%
            for (Sample sample : mySampleList) {
                %>
   
        <tr>
            <td><%=sample.getSampleId()%></td>
            <td><%=sample.getSampleName()%></td>
            <td><%=sample.getSampleValue()%></td>
        </tr> 
    
    
    <%
            }
        %>
             </tbody>
        </table>
    </body>
</html>