<%@page import="Components.RAMLoader"%>
<%@page import="Components.DBConnection"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=ISO-8859-5" %>

<head>
    
    <meta http-equiv="refresh" content="0; url=../CompPage/RamPage.jsp" />
    
</head>
<%
	//legge i valori ricevuti dal form HTML
	String Stringa1 = request.getParameter("brand");
	String Stringa2 = request.getParameter("model");
	String Stringa3 = request.getParameter("ram_type");
	String Stringa4 = request.getParameter("speed");
	String Stringa5 = request.getParameter("tdp");
	int Int1 = Integer.parseInt(Stringa5);
        String Stringa6 = request.getParameter("number_of_modules");
        int Int2 = Integer.parseInt(Stringa6);
	String Stringa7 = request.getParameter("size_of_modules");
	int Int3 = Integer.parseInt(Stringa7);
	String Stringa8 = request.getParameter("size");
	int Int4 = Integer.parseInt(Stringa8);	
        String Stringa9 = request.getParameter("price");
        double db1 = Double.parseDouble(Stringa9);

        
       try{
        DBConnection db = new DBConnection();
        RAMLoader rm = new RAMLoader();
        db.Connect();
        
        db.filldbRAM(Stringa1, Stringa2, Stringa3, Stringa4, Int1, Int2, Int3, Int4, db1);
        
	}
	catch(SQLException ex){
		out.println("Connessione fallita.");
	}
	
	

%>