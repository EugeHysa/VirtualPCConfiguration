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
                    <tr><label>Motherboard:</label><input type="text" value="<% out.println(request.getParameter("mbbrand1") + " " +request.getParameter("mbmodel1")); %>" id="mbField" disabled="disabled"><input type="text" class="hidden" id="mbPrice"></tr><br>
                    <tr><label>Cpu:</label><input type="text" value="<% out.println(request.getParameter("cpubrand1") + " " +request.getParameter("cpumodel1")); %>" id="cpuField" disabled="disabled"><input type="text" class="hidden" id="cpuPrice"></tr><br>
                    <tr><label>Ram:</label><input type="text"  value="<% out.println(request.getParameter("RAMBRAND") + " " +request.getParameter("RAMMODEL")); %>" id="ramField" disabled="disabled"><input type="text" class="hidden" id="ramPrice"></tr><br>
                    <tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled"><input type="text" class="hidden" value="<%out.print(request.getParameter("NEXTPRI"));%>" id="gcPrice"></tr><br>
                    <tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled"><input type="text" class="hidden" id="hdPrice"></tr><br>
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
                    <li id="active1">Graphic Card</li>
                    <li>Hard Disk</li>
                    <li>Power Supply</li>
                    <li>Case</li>
                </ul>
                <!-- Fieldsets -->
                <fieldset id="first">
                <!-- Loading GCard components in a table-->
                <%
                    Double price = Double.parseDouble(request.getParameter("NEXTPRI"));
                    out.println(new HTMLTableCreator().createGCard(false));
                %>
                <form action="HDSystemPage.jsp" method="POST">
                    <input type="hidden" id="GCBRAND" name = "GCBRAND"/>
                    <input type="hidden" id="GCMODEL" name = "GCMODEL"/>
                    <input type="hidden"   id="GCPRICE" name = "GCPRICE"/>
                    <input type="hidden" value="<%out.print(request.getParameter("mbbrand1"));%>" id="mbbrand2" name="mbbrand2">
                    <input type="hidden" value="<%out.print(request.getParameter("mbmodel1"));%>" id="mbmodel2" name="mbmodel2">
                    <input type="hidden" value="<%out.print(request.getParameter("mbprice1"));%>" id="mbprice2" name="mbprice2">
                    <input type="hidden" value="<%out.print(request.getParameter("cpubrand1"));%>" id="cpubrand2" name="cpubrand2">
                    <input type="hidden" value="<%out.print(request.getParameter("cpumodel1"));%>" id="cpumodel2" name="cpumodel2">
                    <input type="hidden" value="<%out.print(request.getParameter("cpuprice1"));%>" id="cpuprice2" name="cpuprice2">
                    <input type="hidden" value="<%out.print(request.getParameter("RAMBRAND"));%>" id="rambrand1" name="rambrand1">
                    <input type="hidden" value="<%out.print(request.getParameter("RAMMODEL"));%>" id="rammodel1" name="rammodel1"> 
                    <input type="hidden" id="NEXTPRI" name="NEXTPRI"/>
                    <input type="submit" value="Next"> 
                </form> 
                <script>
                    var gcIndex;
                    var tableGC = document.getElementById("table4");
                    // get selected row
                    // display selected row data in text input        
                    for(var i = 1; i < tableGC.rows.length; i++)
                    {
                        tableGC.rows[i].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof gcIndex !== "undefined"){ 
                                tableGC.rows[gcIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            gcIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            
                            document.getElementById("gcField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("GCBRAND").value = this.cells[0].innerHTML;
                            document.getElementById("GCMODEL").value = this.cells[1].innerHTML;
                            document.getElementById("GCPRICE").value = this.cells[8].innerHTML;
                            document.getElementById("priceField").value = parseFloat(document.getElementById("gcPrice").value) + parseFloat(this.cells[8].innerHTML);
                            document.getElementById("NEXTPRI").value = parseFloat(document.getElementById("priceField").value);
                            };
                    }
                </script>
                <a href="javascript:history.go(-1)" onMouseOver="self.status.referrer; return true;"><input type="button" value="Previous"></a>
            </fieldset>       
            </div>
            <div class="footer"> <input type="button" value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/></div>
        </div>
    </div>
    </body>
</html>