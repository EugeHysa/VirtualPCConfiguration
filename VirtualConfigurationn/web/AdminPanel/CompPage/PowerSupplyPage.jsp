<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import ="Components.*" %>
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
                                                    <!--fieldset id="first"-->
<%
    out.print(new HTMLTableCreator().createPS(true));
%> 
						<script>
                    var ramIndex;
                    var tableRAM = document.getElementById("table7");
                    // get selected row
                    // display selected row data in text input        
                    for(var i = 1; i < tableRAM.rows.length; i++)
                    {

                        tableRAM.rows[i].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof ramIndex !== "undefined"){
                                tableRAM.rows[ramIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            ramIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            document.getElementById("caseField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            
                           // document.getElementById("RAMBRAND").value = this.cells[0].innerHTML;
                           // document.getElementById("RAMMODEL").value = this.cells[1].innerHTML;
                           // document.getElementById("RAMPRICE").value = this.cells[8].innerHTML; 
                            
                           // document.getElementById("rampriceField").value = document.getElementById("ramPrice").value;
                           // document.getElementById("rampriceField").value = parseFloat(document.getElementById("rampriceField").value) + parseFloat(this.cells[8].innerHTML);
                           // document.getElementBYId("RAMPRICE").value = document.getElementById("ramPrice").value;
                         };
                    }
                    </script>
            <!--/fieldset-->	
						</div>
						<div class="insertside">
							<form action="../AddPage/AddPS.jsp" method="post">
							<table border="0">
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
									<td>Form:</td>
									<td><input type="text" name="form"></td>
								</tr>
								<tr>	
									<td>Efficiency:</td>
									<td><input type="text" name="efficiency"></td>
								</tr>
								<tr>	
									<td>TDP:</td>
                                                                        <td><input type="text" name="tdp"></td>
								</tr>
								<tr>	
									<td>Modular:</td>
									<td><input type="text" name="modular"></td>
								</tr>
								<tr>	
									<td>Price:</td>
									<td><input type="text" name="price"></td>
								</tr>
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

