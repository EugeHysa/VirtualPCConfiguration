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
                    <tr><label>Motherboard:</label><input type="text" value="<% out.println(request.getParameter("mbbrand3") + " " +request.getParameter("mbmodel3")); %>" id="mbField" disabled="disabled"><input type="text" class="hidden" id="mbPrice"></tr><br>
                    <tr><label>Cpu:</label><input type="text"  value="<% out.println(request.getParameter("cpubrand3") + " " +request.getParameter("cpumodel3")); %>"id="cpuField" disabled="disabled"><input type="text" class="hidden" id="cpuPrice"></tr><br>
                    <tr><label>Ram:</label><input type="text" value="<% out.println(request.getParameter("rambrand2") + " " +request.getParameter("rammodel2")); %>" id="ramField" disabled="disabled"><input type="text" class="hidden" id="ramPrice"></tr><br>
                    <tr><label>Graphic Card:</label><input type="text" value="<% out.println(request.getParameter("gcbrand") + " " +request.getParameter("gcmodel")); %>" id="gcField" disabled="disabled"><input type="text" class="hidden" id="gcPrice"></tr><br>
                    <tr><label>Hard Disk:</label><input type="text" value="<% out.println(request.getParameter("HDBRAND") + " " +request.getParameter("HDMODEL")); %>" id="hdField" disabled="disabled"><input type="text" class="hidden" id="hdPrice"></tr><br>
                    <tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"><input type="text" value="<%out.print(request.getParameter("NEXTPRI"));%>" class="hidden" id="psPrice"></tr><br>
                    <tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"><input type="text" class="hidden" id="casePrice"></tr><br><hr>
                    <tr><label>Price:</label><input type="text" value="<%out.print(request.getParameter("NEXTPRI"));%>"  id="priceField" disabled="disabled"><br></tr>
                </table>
            </div>
            <div class="content">
                <!-- Progressbar -->
                <ul id="progressbar">
                    <li>Motherboard</li>
                    <li>Cpu</li>
                    <li>Ram</li>
                    <li>Graphic Card</li>
                    <li>Hard Disk</li>
                    <li id="active1">Power Supply</li>
                    <li>Case</li>
                </ul>
                <!-- Fieldsets -->
                <fieldset id="first">
                <!-- Loading HDisk components in a table-->
                <%
                    out.println(new HTMLTableCreator().createPS(false));
                %>
                <form action="CaseSystemPage.jsp" method="POST">
                    <input type="hidden" id="PSBRAND" name = "PSBRAND"/>
                    <input type="hidden" id="PSMODEL" name = "PSMODEL"/>
                    <input type="text"   id="PSPRICE" name = "PSPRICE"/>
                    <input type="hidden" value="<%out.print(request.getParameter("mbbrand3"));%>" id="mbbrand4" name="mbbrand4">
                    <input type="hidden" value="<%out.print(request.getParameter("mbmodel3"));%>" id="mbmodel4" name="mbmodel4">
                    <input type="hidden" value="<%out.print(request.getParameter("mbprice3"));%>" id="mbprice4" name="mbprice4">
                    <input type="hidden" value="<%out.print(request.getParameter("cpubrand3"));%>" id="cpubrand4" name="cpubrand4">
                    <input type="hidden" value="<%out.print(request.getParameter("cpumodel3"));%>" id="cpumodel4" name="cpumodel4">
                    <input type="hidden" value="<%out.print(request.getParameter("cpuprice3"));%>" id="cpuprice4" name="cpuprice4">
                    <input type="hidden" value="<%out.print(request.getParameter("rambrand2"));%>" id="rambrand3" name="rambrand3">
                    <input type="hidden" value="<%out.print(request.getParameter("rammodel2"));%>" id="rammodel3" name="rammodel3">
                    <input type="hidden" value="<%out.print(request.getParameter("gcbrand"));%>" id="gcbrand1" name="gcbrand1">
                    <input type="hidden" value="<%out.print(request.getParameter("gcmodel"));%>" id="gcmodel1" name="gcmodel1">
                    <input type="hidden" value="<%out.print(request.getParameter("HDBRAND"));%>" id="hdbrand" name="hdbrand">
                    <input type="hidden" value="<%out.print(request.getParameter("HDMODEL"));%>" id="hdmodel" name="hdmodel">
                    <input type="hidden" id="NEXTPRI" name="NEXTPRI"/>
                    <input type="submit" value="Next"> 
                </form> 
                <form action="HDSystemPage.jsp" method="POST">
                    <input type="hidden" id="returncpu" value="<%out.print(request.getParameter("cpuField"));%>">
                    <input type="submit" value="Previous"> 
                </form> 
                <script>
                    var psIndex;
                    var tablePS = document.getElementById("table6");
                    // get selected row
                    // display selected row data in text input        
                    for(var i = 1; i < tablePS.rows.length; i++)
                    {
                        tablePS.rows[i].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof psIndex !== "undefined"){
                                tablePS.rows[psIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            psIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            document.getElementById("psField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            
                            document.getElementById("PSBRAND").value = this.cells[0].innerHTML;
                            document.getElementById("PSMODEL").value = this.cells[1].innerHTML;
                            document.getElementById("priceField").value = parseFloat(document.getElementById("psPrice").value) + parseFloat(this.cells[7].innerHTML);
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