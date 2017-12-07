<%@ page import="Components.*"%>
<%@ page import="DatabaseElements.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./../../CSStyles/BuildSystemStyle.css">
        <link rel="icon" href="./../../CSStyles/projectIcon.png" type="image/png"/>
        <title>V I R T U A L</title>
	</head>
    <body>
    	<div class="grid">
            <div class="header">BANNER</div>
            <div class="navbar">  
                <input type="button" value="SIGN-IN" name="sign-in" onclick="location.href='../../CustomerLogin.jsp'"/>
                <input type="button" value="SIGN-UP" name="sign-up" onclick="location.href='../../reg.jsp'"/>
                <%//Success of login
                if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                %>
                    You are not logged in
                <%} 
                else {%>
                    Welcome <%=session.getAttribute("userid")%> <a href='../../logout.jsp'>Log out</a>
                    <%}%>
            </div>
            <div class="sidebar">
                <table id="configTable" border="0">
                    <tr><label>Motherboard:</label><input type="text" value="<% out.println(request.getParameter("BRAND") + " " +request.getParameter("MODEL")); %>"  id="mbField" disabled="disabled"></input> </tr><br>
                    <tr><label>Cpu:</label><input type="text" id="cpuField" disabled="disabled"><input type="text" class="hidden" value="<% out.print(request.getParameter("MBPRI")); %>" id="cpuPrice"></tr><br>
                    <tr><label>Ram:</label><input type="text" id="ramField" disabled="disabled"></tr><br>
                    <tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled"></tr><br>
                    <tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled"></tr><br>
                    <tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"></tr><br>
                    <tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"></tr><br><hr>
                    <tr><label>Price:</label><input type="text" value="<% out.println(request.getParameter("MBPRI")); %>" id="priceField" disabled="disabled"></input><br></tr>
                </table>
            </div>
            <div class="content">
                <!-- Progressbar -->
                <ul id="progressbar">
                    <li>Motherboard</li>
                    <li id="active1">Cpu</li>
                    <li>Ram</li>
                    <li>Graphic Card</li>
                    <li>Hard Disk</li>
                    <li>Power Supply</li>
                    <li>Case</li>
                </ul>                   
                <fieldset id="first">
                <!-- Loading CPU components in a table-->
                <%
                    String brand = request.getParameter("BRAND");
                    String model = request.getParameter("MODEL");

                    ConfigurationSave cs = (ConfigurationSave) session.getAttribute("confsave");
                    //System.out.println("yeeha" + cs.getPrice());
                    out.print(new HTMLTableCreator().CPUTableCreator(false, brand, model));
                %>
                <!--Sending data to next page-->
                <form action="RAMSystemPage.jsp" method="POST">
                    <input type="hidden" value="<%out.print(request.getParameter("BRAND"));%>" id="mbbrand" name="mbbrand">
                    <input type="hidden" value="<%out.print(request.getParameter("MODEL"));%>" id="mbmodel" name="mbmodel">
                    <input type="hidden" value="" id="CPUBRAND" name="CPUBRAND">
                    <input type="hidden" value="" id="CPUMODEL" name="CPUMODEL">
                    <input type="text" id="NEXTPRI" name="NEXTPRI">
                    <input type="submit" value="Next"> 
		</form> 

                <script>
                    var retMB = document.getElementById("mbField").innerHTML;
                    var cpuIndex;
                    var tableCPU = document.getElementById("table2");
                    // get selected row
                    // display selected row data in text input        
                    for(var i = 1; i < tableCPU.rows.length; i++)
                    {
                        tableCPU.rows[i].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof cpuIndex !== "undefined"){
                                tableCPU.rows[cpuIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            cpuIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            
                            document.getElementById("cpuField").value = this.cells[1].innerHTML;
                            document.getElementById("CPUBRAND").value = this.cells[0].innerHTML;
                            document.getElementById("CPUMODEL").value = this.cells[1].innerHTML;
                            document.getElementById("priceField").value = parseFloat(document.getElementById("cpuPrice").value) + parseFloat(this.cells[6].innerHTML);
                            document.getElementById("NEXTPRI").value = document.getElementById("priceField").value;
                        };                      
                    }
                </script>
                <form id="form" action="MBSystemPage.jsp">
                    <input id="mbField" name="mbField" value="<%out.print(request.getParameter("BRAND") + " " +request.getParameter("MODEL"));%>" type="hidden">
                    <input id="mbPrice" name="mbPrice" value="<%out.print(request.getParameter("MBPRI"));%>" type="hidden">
                </form>
                <a href="javascript:history.go(-1)" onMouseOver="self.status.referrer; return true;"><input type="button" value="Previous"></a>
                <!-- <a href="javascript: document.getElementById('mbField').value; document.getElementById('mbPrice').value; document.getElementById('form').submit();"> <input type="button" value="Previous"></a> -->
                </fieldset>
            </div>
            <div class="footer"> <input type="button" value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/></div>
        </div>
    </body>
</html>