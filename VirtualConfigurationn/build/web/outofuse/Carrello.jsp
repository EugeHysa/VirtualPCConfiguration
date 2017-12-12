<%-- 
    Document   : ProvaSelRowDBTable
    Created on : 20-ott-2017, 16.20.14
    Author     : Deni
--%>
<%@page import="DatabaseElements.*"%>
<%@page import="Components.*"%>
<%@page import="Components.PSLoader"%>
<%@page import="Components.HDriveLoader"%>
<%@page import="Components.RAMLoader"%>
<%@page import="Components.GCardLoader"%>
<%@page import="Components.CPULoader"%>
<%@page import="Components.MBLoader"%>
<%@page import="Components.DBConnection"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SelectColorRowDBTable</title>

        
	<link rel="stylesheet" type="text/css" href="./CSStyles/BuildSystemStyle.css">
     <script type="text/javascript">
            function openPage(pageURL){
                window.location.herf = pageURL;
            }
            </script>

       
    </head>
    <body>
    <div class="grid">
        <div class="header">BANNER</div>
        <div class="navbar">  
            <a href='CustomerLogin.jsp'>SIGN-IN</a>
       <input type="button" value="SIGN-UP" name="sign-up" onclick="openPage('reg.jsp')"/>
                <%//Success of login
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                 %>
                        You are not logged in
                       
                 <%} else {
                 %>
                    Welcome <%=session.getAttribute("userid")%>
                    <a href='logout.jsp'>Log out</a>
                 <%
                    }
                 %></div>
                 

                 
       <div class="sidebar">
            <table id="configTable" border="0">
                <tr><label>Motherboard:</label><input type="text" id="mbField" value="<% String brand = request.getParameter("mbbrand");
                                                                                         String model = request.getParameter("mbmodel");
                                                                                         out.println(new Carrello().getMBFIELD(brand, model));
                                                                                      %>" >
                <input type="text" class="hidden" id="mbPrice"></tr><br>
                
                <tr><label>Cpu:</label><input type="text" id="cpuField"><input type="text" class="hidden" id="cpuPrice"></tr><br>
                
                <tr><label>Ram:</label><input type="text" id="ramField"><input type="text" class="hidden" id="ramPrice"></tr><br>
               
                <tr><label>Graphic Card:</label><input type="text" id="gcField"><input type="text" class="hidden" id="gcPrice"></tr><br>
                
                <tr><label>Hard Disk:</label><input type="text" id="hdField"><input type="text" class="hidden" id="hdPrice"></tr><br>
                
                <tr><label>Power Supply:</label><input type="text" id="psField"><input type="text" class="hidden" id="psPrice"></tr><br>
                
                <tr><label>Case:</label><input type="text" id="caseField"><input type="text" class="hidden" id="casePrice"></tr><br><hr>
                
                <tr><label>Price:</label><input type="text" id="rampriceField"><br></tr>
            
            </table>
        </div>
       
         
           