<%@ page import="JSPElements.*"%>
<%@ page import="DatabaseElements.*"%>
<%@ page import="Components.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*Inserimento dei dati nella purchase*/
    ConfigurationSave confSave = (ConfigurationSave) session.getAttribute("confSave");
    String mbcod = (String) request.getSession().getAttribute("mbCod");
    String cpucod = (String) request.getSession().getAttribute("cpuCod");
    String ramcod = (String) request.getSession().getAttribute("ramCod");
    String gccod = (String) request.getSession().getAttribute("gcCod");
    String hdcod = (String) request.getSession().getAttribute("hdCod");
    String pscod = (String) request.getSession().getAttribute("psCod");
    String casecod = (String) request.getSession().getAttribute("caseCod");
    //Connessioni al db
    Connection conn;
    Statement mystmt;
    ResultSet res, res2;
    /*Inserimento componenti nella tabella purchase*/
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualconfiguration", "root", "12345");
        mystmt = conn.createStatement();
        
        int ress;
        ress = mystmt.executeUpdate("insert into purchases (MCOD, CPUCOD, RCOD, GCOD, HCOD, PCOD, CSCOD) values('"+mbcod+"', '"+cpucod+"', '"+ramcod+"', '"+gccod+"', '"+hdcod+"', '"+pscod+"', '"+casecod+"')");   
        
        /*Estrapolare codice del purchase inserito*/
        res = mystmt.executeQuery("SELECT COD FROM purchases");
        
        int actualCod = 0;
        while (res.next()){
            if (res.getInt(1) > actualCod){
                actualCod = res.getInt(1);
            }
        };
        
        /*Estrapolare codice customer*/
        String userid = (String) request.getSession().getAttribute("userid");
        res2 = mystmt.executeQuery("select USERSAVE from CustomerLogin where USERNAME = '"+ userid +"' ");
        String CusCod = res2.getString(1);
        
        /*Riempire tabella congiunzione con codice customer e codice purchase*/
        int ress2;
        ress2 = mystmt.executeUpdate("insert into SAVES (SAVECOD, PURCOD) values('"+ CusCod +"', '"+ actualCod +"') ");   
    }
    catch(SQLException ex){
        out.println("Connessione fallita.");
    }
%>
<script>window.location.replace("../../index.html");</script>