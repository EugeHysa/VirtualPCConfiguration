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
                    <tr><label>Motherboard:</label><input type="text" id="mbField" disabled="disabled" value="<% out.println(request.getParameter("mbbrand4") + " " +request.getParameter("mbmodel4")); %>" ><input type="text" class="hidden" id="mbPrice"></tr><br>
                    <tr><label>Cpu:</label><input type="text" id="cpuField" disabled="disabled" value="<% out.println(request.getParameter("cpubrand3") + " " +request.getParameter("cpumodel3")); %>" ><input type="text" class="hidden" id="cpuPrice"></tr><br>
                    <tr><label>Ram:</label><input type="text" id="ramField" disabled="disabled" value="<% out.println(request.getParameter("rambrand3") + " " +request.getParameter("rammodel3")); %>" ><input type="text" class="hidden" id="ramPrice"></tr><br>
                    <tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled" value="<% out.println(request.getParameter("gcbrand1") + " " +request.getParameter("gcmodel1")); %>" ><input type="text" class="hidden" id="gcPrice"></tr><br>
                    <tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled" value="<% out.println(request.getParameter("hdbrand") + " " +request.getParameter("hdmodel")); %>" ><input type="text" class="hidden" id="hdPrice"></tr><br>
                    <tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled" value="<% out.println(request.getParameter("PSBRAND") + " " +request.getParameter("PSMODEL")); %>"  ><input type="text" class="hidden" id="psPrice"></tr><br>
                    <tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"><input type="text" class="hidden" id="casePrice" value="<%out.print(request.getParameter("NEXTPRI"));%>" ></tr><br><hr>
                    <tr><label>Price:</label><input type="text" value="<%out.print(request.getParameter("NEXTPRI"));%>" id="priceField" disabled="disabled"><br></tr>
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
                    <li>Power Supply</li>
                    <li id="active1">Case</li>
                </ul>
                <!-- Loading HDisk components in a table-->
                <%
                    out.println(new HTMLTableCreator().createCase(false));
                %>
                <form action="FinalSystemPage.jsp" method="POST">
                    <input type="hidden" id="PSBRAND" name = "PSBRAND"/>
                    <input type="hidden" id="PSMODEL" name = "PSMODEL"/>
                    <input type="hidden"   id="PSPRICE" name = "PSPRICE"/>
                    <input type="hidden" value="<%out.print(request.getParameter("mbbrand4"));%>" id="mbbrand5" name="mbbrand5">
                    <input type="hidden" value="<%out.print(request.getParameter("mbmodel4"));%>" id="mbmodel5" name="mbmodel5">
                    <input type="hidden" value="<%out.print(request.getParameter("mbprice4"));%>" id="mbprice5" name="mbprice5">
                    <input type="hidden" value="<%out.print(request.getParameter("CPUBRAND"));%>" id="cpubrand" name="cpubrand">
                    <input type="hidden" value="<%out.print(request.getParameter("CPUMODEL"));%>" id="cpumodel" name="cpumodel">
                    <input type="hidden" value="<%out.print(request.getParameter("CPUPRICE"));%>" id="cpuprice" name="cpuprice">
                    <input type="hidden" id="NEXTPRI" name="NEXTPRI"/>
                    <input type="submit" value="Next"> 
                </form> 
                <form action="PSSystemPage.jsp" method="GET">
                    <input type="submit" value="Previous"> 
                </form> 
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
                            document.getElementById("priceField").value = parseFloat(document.getElementById("casePrice").value) + parseFloat(this.cells[6].innerHTML);
                            document.getElementById("NEXTPRI").value = parseFloat(document.getElementById("priceField").value);
                         };
                    }
                    </script>
                    <a href="javascript:history.go(-1)" onMouseOver="self.status.referrer; return true;"></a>
            </div>
            <div class="footer">
                <input type="button" value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/>
                <input type="button" value="Restart" name="RestartConfig" onclick="location.href='../../index.html'"/>
            </div>
        </div>
    </body>
</html>