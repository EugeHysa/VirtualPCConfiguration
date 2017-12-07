<%@ page import="DatabaseElements.*"%>
<%@ page import="Components.*"%>
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
            <script language="javascript">addCommentR();</script>     
            <div class="sidebar">
                <table id="configTable" border="0">
                    <tr><label>Motherboard:</label><input type="text" value="<% out.println(request.getParameter("mbbrand2") + " " +request.getParameter("mbmodel2")); %>" id="mbField" disabled="disabled"><input type="text" class="hidden" id="mbPrice"></tr><br>
                    <tr><label>Cpu:</label><input type="text" value="<% out.println(request.getParameter("cpubrand2") + " " +request.getParameter("cpumodel2")); %>" id="cpuField" disabled="disabled"><input type="text" class="hidden" id="cpuPrice"></tr><br>
                    <tr><label>Ram:</label><input type="text" value="<% out.println(request.getParameter("rambrand1") + " " +request.getParameter("rammodel1")); %>" id="ramField" disabled="disabled"><input type="text" class="hidden" id="ramPrice"></tr><br>
                    <tr><label>Graphic Card:</label><input type="text" value="<% out.println(request.getParameter("GCBRAND") + " " +request.getParameter("GCMODEL")); %>" id="gcField" disabled="disabled"><input type="text" class="hidden" id="gcPrice"></tr><br>
                    <tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled"><input type="text" class="hidden" value="<%out.print(request.getParameter("NEXTPRI"));%>" id="hdPrice"></tr><br>
                    <tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"><input type="text" class="hidden" id="psPrice"></tr><br>
                    <tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"><input type="text" class="hidden" id="casePrice"></tr><br><hr>
                    <tr><label>Price:</label><input type="text" value="<% out.print(request.getParameter("NEXTPRI")); %>" id="priceField" disabled="disabled"><br></tr>
                </table>
            </div>
            <div class="content">
                <!-- Progressbar -->
                <ul id="progressbar">
                    <li>Motherboard</li>
                    <li>Cpu</li>
                    <li>Ram</li>
                    <li>Graphic Card</li>
                    <li id="active1">Hard Disk</li>
                    <li>Power Supply</li>
                    <li>Case</li>
                </ul>
                <!-- Fieldsets -->
                <fieldset id="first">
                <!-- Loading HDisk components in a table-->
                <%
                    out.println(new HTMLTableCreator().createHDrive(false));
                %>
                <form action="PSSystemPage.jsp" method="POST">
                    <input type="hidden" id="HDBRAND" name = "HDBRAND"/>
                    <input type="hidden" id="HDMODEL" name = "HDMODEL"/>
                    <input type="hidden" id="HDPRICE" name = "HDPRICE"/>
                    <input type="hidden" value="<%out.print(request.getParameter("mbbrand2"));%>" id="mbbrand3" name="mbbrand3">
                    <input type="hidden" value="<%out.print(request.getParameter("mbmodel2"));%>" id="mbmodel3" name="mbmodel3">
                    <input type="hidden" value="<%out.print(request.getParameter("mbprice2"));%>" id="mbprice3" name="mbprice3">
                    <input type="hidden" value="<%out.print(request.getParameter("cpubrand2"));%>" id="cpubrand3" name="cpubrand3">
                    <input type="hidden" value="<%out.print(request.getParameter("cpumodel2"));%>" id="cpumodel3" name="cpumodel3">
                    <input type="hidden" value="<%out.print(request.getParameter("cpuprice2"));%>" id="cpuprice3" name="cpuprice3">
                    <input type="hidden" value="<%out.print(request.getParameter("rambrand1"));%>" id="rambrand2" name="rambrand2">
                    <input type="hidden" value="<%out.print(request.getParameter("rammodel1"));%>" id="rammodel2" name="rammodel2">
                    <input type="hidden" value="<%out.print(request.getParameter("GCBRAND"));%>" id="gcbrand" name="gcbrand">
                    <input type="hidden" value="<%out.print(request.getParameter("GCMODEL"));%>" id="gcmodel" name="gcmodel">
                    <input type="hidden" id="NEXTPRI" name="NEXTPRI"/>
                    <input type="submit" value="Next"> 
                </form>
                <script>
                    var hdIndex;
                    var tableHD = document.getElementById("table5");
                    // get selected row
                    // display selected row data in text input        
                         for(var i = 1; i < tableHD.rows.length; i++)
                         {
                          tableHD.rows[i].onclick = function()
                          {
                            //Remove the previous selected row
                           if (typeof hdIndex !== "undefined"){
                              tableHD.rows[hdIndex].classList.toggle("selected");
                           }
                           //Get the selected row index
                           hdIndex = this.rowIndex;
                           //Add class to the selected row
                           this.classList.toggle("selected");
                           document.getElementById("hdField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                           document.getElementById("HDBRAND").value = this.cells[0].innerHTML;
                           document.getElementById("HDMODEL").value = this.cells[1].innerHTML;
                           document.getElementById("priceField").value = parseFloat(document.getElementById("hdPrice").value) + parseFloat(this.cells[8].innerHTML);
                           document.getElementById("NEXTPRI").value = parseFloat(document.getElementById("priceField").value);
                       };
                    }
                </script>
                <a href="javascript:history.go(-1)" onMouseOver="self.status.referrer; return true;"><input type="button" value="Previous"></a>
                </fieldset>
            </div>
            <div class="footer"> <input type="button" value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/></div>
        </div>
    </body>
</html>