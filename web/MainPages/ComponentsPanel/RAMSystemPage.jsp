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
            <div class="sidebar">
                <table id="configTable" border="0">
                    <tr><label>Motherboard:</label><input type="text" value="<% out.println(request.getParameter("mbbrand") + " " +request.getParameter("mbmodel")); %>"  id="mbField" disabled="disabled"></input> </tr><br>
                    <tr><label>Cpu:</label><input type="text" value="<% out.println(request.getParameter("CPUBRAND") + " " +request.getParameter("CPUMODEL")); %>" id="cpuField" disabled="disabled"><input type="text" class="hidden"  id="cpuPrice"></tr><br>
                    <tr><label>Ram:</label><input type="text"  id="ramField" disabled="disabled"><input type="text" class="hidden" value="<%out.print(request.getParameter("NEXTPRI"));%>" id="ramPrice"></tr><br>
                    <tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled"><input type="text" class="hidden" id="gcPrice"></tr><br>
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
                    <li id="active1">Ram</li>
                    <li>Graphic Card</li>
                    <li>Hard Disk</li>
                    <li>Power Supply</li>
                    <li>Case</li>
                </ul>
                <!-- Fieldsets -->
                <fieldset id="first">
                <!-- Loading RAM components in a table-->
                <%
                    String brand = request.getParameter("mbbrand");
                    String model = request.getParameter("mbmodel");
                    Double price = Double.parseDouble(request.getParameter("NEXTPRI"));
                    out.print(new HTMLTableCreator().RAMTableCreator(false, brand, model));
                %>
                <script>
                    var ramIndex;
                    var tableRAM = document.getElementById("table3");
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
                            document.getElementById("RAMBRAND").value = this.cells[0].innerHTML;
                            document.getElementById("RAMMODEL").value = this.cells[1].innerHTML;
                            document.getElementById("ramField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("priceField").value = parseFloat(document.getElementById("ramPrice").value) + parseFloat(this.cells[8].innerHTML);
                            document.getElementById("NEXTPRI").value = parseFloat(document.getElementById("priceField").value); 
                        };
                    }
                </script>
                <form action ="GCSystemPage.jsp" method="POST" >
                    <input type="hidden" value="<%out.print(request.getParameter("mbbrand"));%>" id="mbbrand1" name="mbbrand1">
                    <input type="hidden" value="<%out.print(request.getParameter("mbmodel"));%>" id="mbmodel1" name="mbmodel1">
                    <input type="hidden" value="<%out.print(request.getParameter("CPUBRAND"));%>" id="cpubrand1" name="cpubrand1">
                    <input type="hidden" value="<%out.print(request.getParameter("CPUMODEL"));%>" id="cpumodel1" name="cpumodel1">
                    <input type="hidden" value="" id="RAMBRAND" name="RAMBRAND">
                    <input type="hidden" value="" id="RAMMODEL" name="RAMMODEL">
                    <input type="hidden" id="NEXTPRI" name="NEXTPRI"/>
                    <input type="submit" value="Next">
                </form>
                <a href="javascript:history.go(-1)" onMouseOver="self.status.referrer; return true;"><input type="button" value="Previous"></a>    
                <!--    <a href="javascript: document.getElementById('cpuField').value; document.getElementById('cpuPrice').value; document.getElementById('form').submit();"> <input type="button" value="Previous"></a> -->
                </fieldset>
            </div>
            <div class="footer"> <input type="button" value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/></div>
        </div>
    </body>
</html>