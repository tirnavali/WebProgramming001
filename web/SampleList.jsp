<%-- 
    Document   : SampleList
    Created on : Feb 4, 2020, 3:38:32 PM
    Author     : 62542
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
        
    Class.forName("org.sqlite.JDBC");
    
    String DB_NAME="hello-todo.db";
    String DB_PATH ="jdbc:sqlite:d:\\62542\\My Documents\\db\\";
    String CONNECTION_STR = DB_PATH + DB_NAME ;
    String TABLE_NAME = "Sample";
    String TABLE_COL_ID = "sampleId";
    String TABLE_COL_NAME = "sampleName";
    String TABLE_COL_VAL = "sampleValue";
    
    String SELECT_ALL = "SELECT * FROM "+ TABLE_NAME;
    


    Connection connection = DriverManager.getConnection(CONNECTION_STR,"","");
    PreparedStatement stmt = connection.prepareStatement(SELECT_ALL);
    
    ResultSet rs =  stmt.executeQuery();

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
            while(rs.next()) {
                %>
   
        <tr>
            <td><%=rs.getInt(TABLE_COL_ID)%></td>
            <td><%=rs.getString(TABLE_COL_NAME)%></td>
            <td><%=rs.getDouble(TABLE_COL_VAL)%></td>
        </tr> 
    
    
    <%
            }
        %>
             </tbody>
        </table>
    </body>
</html>
<% connection.close(); %>