<%@page import="Components.CPULoader"%>
<%@page import="Components.DBConnection"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=ISO-8859-5" %>

<head>
    
    <meta http-equiv="refresh" content="0; url=../CompPage/CpuPage.jsp" />
    
</head>

<%
	//legge i valori ricevuti dal form HTML
        String Stringa1 = request.getParameter("brand");
	String Stringa2 = request.getParameter("model");
	String Stringa3 = request.getParameter("socket");
	String Stringa4 = request.getParameter("frequenza_GHZ");
	Double db1 = Double.parseDouble(Stringa4);
	String Stringa6 = request.getParameter("cores");
        int int2 = Integer.parseInt(Stringa6);
	String Stringa7 = request.getParameter("tdp");
	int int3 = Integer.parseInt(Stringa7);
        String Stringa8 = request.getParameter("price");
        double db2 = Double.parseDouble(Stringa8);

	
	try{
        DBConnection db = new DBConnection();
        CPULoader cp = new CPULoader();
        db.Connect();
        
        db.filldbCPU(Stringa1, Stringa2, Stringa3, db1, int2, int3, db2);
        
        
        
	}
	catch(SQLException ex){
		out.println("Connessione fallita.");
	}
%>