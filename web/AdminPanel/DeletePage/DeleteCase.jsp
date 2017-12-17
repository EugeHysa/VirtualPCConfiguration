<%@ page import="DatabaseElements.*"%>
<%@page import="java.sql.SQLException"%>

<html>

<head>
    
    <meta http-equiv="refresh" content="0; url=../CompPage/CasePage.jsp" />
    
</head>
    
    
<%
    String st1 = request.getParameter("deletecod");
    
    
    
    try{
    DBConnection db = new DBConnection();
    db.Connect();
    db.removeShrt("PCCASE",st1.trim());
    db.closeall();
    }
    catch(SQLException e)
    {
        
    }
    
    
%>


</html>
