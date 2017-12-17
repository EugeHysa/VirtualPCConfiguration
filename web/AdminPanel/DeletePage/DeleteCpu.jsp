<%@ page import="DatabaseElements.*"%>
<%@page import="java.sql.SQLException"%>

<html>
<head>
    
    <meta http-equiv="refresh" content="0; url=../CompPage/CpuPage.jsp" />
    
</head>
    
    
<%
    String st1 = new String(request.getParameter("deletecod"));
    
    
   
    try{
    DBConnection db = new DBConnection();
    db.Connect();
    db.removeShrt("CPU",st1.trim());
    db.closeall();
    }
    catch(SQLException e)
    {
        
    }
    
    
%>


</html>

