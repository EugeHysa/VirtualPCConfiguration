<%@ page import="JSPElements.*"%>
<%@ page import="DatabaseElements.*"%>
<%@ page import="Components.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ConfigurationSave confSave = (ConfigurationSave) session.getAttribute("confSave");
    String mbcod = (String) request.getSession().getAttribute("mbCod");
    String cpucod = (String) request.getSession().getAttribute("cpuCod");
    String ramcod = (String) request.getSession().getAttribute("ramCod");
    String gccod = (String) request.getSession().getAttribute("gcCod");
    String hdcod = (String) request.getSession().getAttribute("hdCod");
    String pscod = (String) request.getSession().getAttribute("psCod");
    String casecod = (String) request.getSession().getAttribute("caseCod");
    Connection conn;
    Statement mystmt;
    ResultSet res;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualconfiguration", "root", "12345");
        mystmt = conn.createStatement();
        
        int ress;
        ress = mystmt.executeUpdate("insert into purchases (MCOD, CPUCOD, RCOD, GCOD, HCOD, PCOD, CSCOD) values('"+mbcod+"', '"+cpucod+"', '"+ramcod+"', '"+gccod+"', '"+hdcod+"', '"+pscod+"', '"+casecod+"')");   
    }
    catch(SQLException ex){
        out.println("Connessione fallita.");
    }
    
%>
<script>window.location.replace("../../index.html");</script>