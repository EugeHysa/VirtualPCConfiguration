<%-- 
    Document   : ProvaSelRowDBTable
    Created on : 20-ott-2017, 16.20.14
    Author     : Deni
--%>
<%@page import="Components.*"%>
<%@page import="Components.PSLoader"%>
<%@page import="Components.HDriveLoader"%>
<%@page import="Components.RAMLoader"%>
<%@page import="Components.GCardLoader"%>
<%@page import="Components.CPULoader"%>
<%@page import="Components.MBLoader"%>
<%@page import="Components.DBConnection"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SelectColorRowDBTable</title>
        

        
	<link rel="stylesheet" type="text/css" href="./CSStyles/BuildSystemStyle.css">
        


    </head>
    <body>
    <div class="grid">
        <div class="header">BANNER</div>
        
<div class="navbar"> 
       <a href='CustomerLogin.jsp'>SIGN-IN</a>
       <a href='reg.jsp'>SIGN-UP</a>
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
                 %>
</div>
                 
                 
        <div class="sidebar">
            <table id="configTable" border="0">
                <tr><label>Motherboard:</label><input type="text" id="mbField"><input type="text" class="hidden" id="mbPrice"></tr><br>
                <tr><label>Cpu:</label><input type="text" id="cpuField"><input type="text" class="hidden" id="cpuPrice"></tr><br>
                <tr><label>Ram:</label><input type="text" id="ramField"><input type="text" class="hidden" id="ramPrice"></tr><br>
                <tr><label>Graphic Card:</label><input type="text" id="gcField"><input type="text" class="hidden" id="gcPrice"></tr><br>
                <tr><label>Hard Disk:</label><input type="text" id="hdField"><input type="text" class="hidden" id="hdPrice"></tr><br>
                <tr><label>Power Supply:</label><input type="text" id="psField"><input type="text" class="hidden" id="psPrice"></tr><br>
                <tr><label>Case:</label><input type="text" id="caseField"><input type="text" class="hidden" id="casePrice"></tr><br><hr>
                <tr><label>Price:</label><input type="text" id="priceField"><br></tr>
            </table>
        </div>
        <div class="content">

                <!-- Progressbar -->
                <ul id="progressbar">
                   
                    <li id="active1">MotherBoard</li>
                  
                </ul>
                <!-- Fieldsets -->
                <fieldset id="first">
                    <!-- Loading Motherboard components in a table-->
                   
                        
                <%
                    
     out.println(new HTMLTableCreator().MBTableCreator(false));

                 
                               
                    %>


<form action="CPUSystemPage.jsp" method="GET">
	<input type="hidden" id="BRAND" name = "BRAND"/>
        <input type="hidden" id="MODEL" name = "MODEL"/>
         <input type="hidden" id="PRICE" name = "PRICE"/>
	<input type="submit" value="Next"> 
</form>
 <script>
                    var mbIndex;
                    var tableMB = document.getElementById("table1");
                    // get selected row
                    // display selected row data in text input 
                    for(var a = 1; a < tableMB.rows.length; a++)
                    {
                         tableMB.rows[a].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof mbIndex !== "undefined"){
                                tableMB.rows[mbIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            mbIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            document.getElementById("mbField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("mbPrice").value = this.cells[9].innerHTML;
                            document.getElementById("priceField").value = this.cells[9].innerHTML;
                          
                            document.getElementById("BRAND").value = this.cells[0].innerHTML ;
                            document.getElementById("MODEL").value = this.cells[1].innerHTML;
                            document.getElementById("PRICE").value = this.cells[9].innerHTML;
                        };
                        
                        

                    }
                </script>  
                    
                </fieldset>

	</div>
        
        <div class="footer">  
        <a href='indexadmin.jsp'>ADMIN-MODE</a>
        </div>
       </div>
    </body>
</html>
