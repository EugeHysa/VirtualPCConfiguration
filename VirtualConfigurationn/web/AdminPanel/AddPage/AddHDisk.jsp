<%@page import="Components.HDriveLoader"%>
<%@page import="Components.DBConnection"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=ISO-8859-5" %>

<head>
    
    <meta http-equiv="refresh" content="0; url=../CompPage/HDiskPage.jsp" />
    
</head>
<%
	//legge i valori ricevuti dal form HTML
	String Stringa1 = new String (request.getParameter("brand"));
	String Stringa2 = new String (request.getParameter("model"));
	String Stringa3 = new String (request.getParameter("series"));
	String Stringa4 = new String (request.getParameter("form"));
	String Stringa5 = new String (request.getParameter("type"));
	String Stringa6 = new String (request.getParameter("size"));
	int Int1 = Integer.parseInt(Stringa6);
        String Stringa7 = new String (request.getParameter("tdp"));
	int Int2 = Integer.parseInt(Stringa7);
	String Stringa8 = new String (request.getParameter("cache"));
	int Int3 = Integer.parseInt(Stringa8);
        String Stringa9 = new String (request.getParameter("price"));
        double db1 = Double.parseDouble(Stringa9);

	try{
        DBConnection db = new DBConnection();
        db.Connect();
        
        db.filldbHDrive(Stringa1, Stringa2, Stringa3, Stringa4, Stringa5, Int1, Int2, Int3, db1);
        
        
        
	}
	catch(SQLException ex){
		out.println("Connessione fallita.");
	}

%>