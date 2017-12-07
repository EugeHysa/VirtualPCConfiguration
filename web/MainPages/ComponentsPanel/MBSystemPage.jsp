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
            <div class="header">GUARDA CHE BEL BANNER HO FATTO</div>
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
                    <tr><label>Motherboard:</label><input type="text" id="mbField" disabled="disabled" value="<% String o = "";   if((o=request.getParameter("mbField"))!=null) out.print(o); %>"></tr><br>
                    <tr><label>Cpu:</label><input type="text" id="cpuField" disabled="disabled"></tr><br>
                    <tr><label>Ram:</label><input type="text" id="ramField" disabled="disabled"></tr><br>
                    <tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled"></tr><br>
                    <tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled"></tr><br>
                    <tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"></tr><br>
                    <tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"></tr><br><hr>
                    <tr><label>Price:</label><input type="text" id="priceField" disabled="disabled" value="<% if(request.getParameter("mbPrice")!=null) out.println(request.getParameter("mbPrice"));%>" ><br></tr>
                </table>
            </div>
            <div class="content">
                <!-- Progressbar -->
                <ul id="progressbar">
                    <li id="active1">Motherboard</li>
                    <li id="active2">Cpu</li>
                    <li id="active3">Ram</li>
                    <li id="active4">Graphic Card</li>
                    <li id="active5">Hard Disk</li>
                    <li id="active6">Power Supply</li>
                    <li id="active7">Case</li>
                </ul>
                <!-- Fieldsets -->
                <fieldset id="first">
                <!-- Loading Motherboard components in a table-->
                <%
                    out.println(new HTMLTableCreator().MBTableCreator(false));

                    ConfigurationSave cs = new ConfigurationSave();

                    session.setAttribute("confsave", cs);
                %>
                <!--Sending data to next page-->
                <form action="./CPUSystemPage.jsp" method="POST">
                    <input type="hidden" id="BRAND" name = "BRAND"/>
                    <input type="hidden" id="MODEL" name = "MODEL"/>
                    <input type="hidden" id="MBPRI" name="MBPRI"/>
                    <input type="submit" value="Next"> 
                </form>
                <script>
                    var mbIndex;
                    var tableMB = document.getElementById("table1");
                    // get selected row and display selected row data in text input
                    for(var a = 1; a < tableMB.rows.length; a++)
                    {
                        tableMB.rows[a].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof mbIndex !== "undefined")
                            {
                                tableMB.rows[mbIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            mbIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            document.getElementById("BRAND").value = this.cells[0].innerHTML;
                            document.getElementById("MODEL").value = this.cells[1].innerHTML;
                            document.getElementById("mbField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("MBPRI").value = this.cells[9].innerHTML;
                            document.getElementById("priceField").value = this.cells[9].innerHTML;
                        };
                    }
                </script>
                </fieldset>
            </div>
            <div class="footer"><input type="button" value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/></div>
        </div>
    </body>
</html>
