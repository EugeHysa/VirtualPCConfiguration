<%@page import="Components.GCardLoader"%>
<%@page import="Components.DBConnection"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=ISO-8859-5" %>

<head>
    
    <meta http-equiv="refresh" content="0; url=../CompPage/GCardPage.jsp" />
    
</head>

<%
	//legge i valori ricevuti dal form HTML
        Integer int1 = new Integer(request.getParameter("cod"));
	String Stringa1 = new String (request.getParameter("brand"));
	String Stringa2 = new String (request.getParameter("model"));
	String Stringa3 = new String (request.getParameter("series"));
	String Stringa4 = new String (request.getParameter("chipset"));
	String Stringa5 = new String (request.getParameter("memory"));
	int int2 = Integer.parseInt(Stringa5);
        String Stringa6 = new String (request.getParameter("core_clock"));
        int int3 = Integer.parseInt(Stringa6);
	String Stringa7 = new String (request.getParameter("tdp"));
	int int4 = Integer.parseInt(Stringa7);
	String Stringa8 = new String (request.getParameter("length"));
	Double db1 = Double.parseDouble(Stringa8);
	String Stringa9 = new String (request.getParameter("price"));
        Double db2 = Double.parseDouble(Stringa9);

	try{
        DBConnection db = new DBConnection();
        GCardLoader gc = new GCardLoader();
        db.Connect();
        
        db.filldbGCard(int1, Stringa1, Stringa2, Stringa3, Stringa4, int2, db1, int3, int4, db2); 
	}
	catch(SQLException ex){
		out.println("Connessione fallita.");
	}
        %>