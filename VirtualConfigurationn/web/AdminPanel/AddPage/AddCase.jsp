<%@page import="Components.*"%>
<%@page import="Components.MBLoader"%>
<%@page import="Components.DBConnection"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=ISO-8859-5" %>

<head>
    
    <meta http-equiv="refresh" content="0; url=../CompPage/CasePage.jsp" />
    
</head>

<%
	//legge i valori ricevuti dal form HTML
	String Stringa1 = request.getParameter("brand");
	String Stringa2 = request.getParameter("model");
	String Stringa3 = request.getParameter("type");
	String Stringa4 = request.getParameter("color");
	String Stringa5 = request.getParameter("mb_comp");
        String Stringa6 = request.getParameter("max_hd_len");
        Double db1 = Double.parseDouble(Stringa6);
	String Stringa7 = request.getParameter("price") ;
        double db2 = Double.parseDouble(Stringa7);

	
	try{
        DBConnection db = new DBConnection();
        CaseLoader c = new CaseLoader();
        db.Connect();
        
        db.filldbCase(Stringa1, Stringa2, Stringa3, Stringa4, Stringa5, db1, db2);
        
        
        
	}
	catch(SQLException ex){
		out.println("Connessione fallita.");
	}
	
	

%>
