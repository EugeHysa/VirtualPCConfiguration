<%@page import="Components.*"%>
<%@page import="Components.DBConnection"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="te3xt7htarset=ISO-8859-5" %>
<html>
	<head>
		<title> Update DB Components </title>
		<link rel="stylesheet" href="../../CSStyles/UpdateDBCompStyle.css">

	</head>
	<body>
		<center>
					<h1> Choose Type of Component </h1> <br>
<div>   <%//Success of login
                    if ((session.getAttribute("useridadm") == null) || (session.getAttribute("useridadm") == "")) {
                        response.sendRedirect("../../indexadmin.jsp"); 
                 %>
                 <%} else {
                 %>
                    Welcome <%=session.getAttribute("useridadm")%>
                    <a href='../../logout.jsp'>Log out</a>
                 <%
                    }
%></div>
					<div class="components">
						<input type="button" value="Motherboard" name="motherboard" onclick="location.href='MotherboardPage.jsp'"/>
						<input type="button" value="CPU" name="cpu" onclick="location.href='CpuPage.jsp'"/>
						<input type="button" value="RAM" name="ram" onclick="location.href='RamPage.jsp'"/>
						<input type="button" value="Graphics Card" name="gcard" onclick="location.href='GCardPage.jsp'"/>
						<input type="button" value="Hard Disk" name="hdisk" onclick="location.href='HDiskPage.jsp'"/>
						<input type="button" value="Power Supply" name="powersupply" onclick="location.href='PowerSupplyPage.jsp'"/>
						<input type="button" value="Case" name="case" onclick="location.href='CasePage.jsp'"/>
					</div>
					<div class="grid">
						<div class="tableside">
							<table id="table" border="1">
								
<%
     out.print(new HTMLTableCreator().createGCard(true));
    
%> 
							</table>
						</div>
						<div class="insertside">
							<form action="../AddPage/AddGCard.jsp" method="post">
							<table border="0">
                                                                <tr>
									<td>Cod:</td>
									<td><input type="text" name="cod"></td>
								</tr>
								<tr>
									<td>Brand:</td>
									<td><input type="text" name="brand"></td>
								</tr>
								<tr>
									<td>Model:</td>
									<td><input type="text" name="model"></td>
								</tr>
								<tr>	
									<td>Series:</td>
									<td><input type="text" name="series"></td>
								</tr>
								<tr>	
									<td>Chipset:</td>
									<td><input type="text" name="chipset"></td>
								</tr>
								<tr>	
									<td>Memory:</td>
									<td><input type="text" name="memory"></td>
								</tr>
								<tr>	
									<td>Core_Clock:</td>
									<td><input type="text" name="core_clock"></td>
								</tr>
								<tr>	
									<td>TDP:</td>
									<td><input type="text" name="tdp"></td>
								</tr>
								<tr>	
									<td>Length:</td>
									<td><input type="text" name="length"></td>
								</tr>
								<tr>	
									<td>Price:</td>
									<td><input type="text" name="price"></td>
								</tr>
								<tr>		
								<tr>
									<td><input type="submit" value="Aggiungi"></td>
								</tr>
                                                                
							</table>
							</form>
                                                    
                                                    
						</div>
					</div>
		</center>
	</body>
</html>
