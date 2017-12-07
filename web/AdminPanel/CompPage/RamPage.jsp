<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import ="Components.*" %>
<%@ page contentType="te3xt7htarset=ISO-8859-5" %>
<html>
    <head>
        <title> ADMINISTRATION MODE </title>
        <link rel="stylesheet" href="../../CSStyles/UpdateDBCompStyle.css">
    </head>
    <body>
        <div class="grid">
            <div class="header"><h1> Admin Side - Choose Type of Component </h1>
            <%//Success of login
            if ((session.getAttribute("useridadm") == null) || (session.getAttribute("useridadm") == "")) {
                response.sendRedirect("../../indexadmin.jsp"); 
            } else { %>
                Welcome <%=session.getAttribute("useridadm")%> <a href='../../logout.jsp'>Log out</a>
            <%}%>
            </div>
            <div class="navbar">
                <input type="button" value="Motherboard" name="motherboard" onclick="location.href='MotherboardPage.jsp'"/>
                <input type="button" value="CPU" name="cpu" onclick="location.href='CpuPage.jsp'"/>
                <input type="button" value="RAM" name="ram" onclick="location.href='RamPage.jsp'"/>
                <input type="button" value="Graphics Card" name="gcard" onclick="location.href='GCardPage.jsp'"/>
                <input type="button" value="Hard Disk" name="hdisk" onclick="location.href='HDiskPage.jsp'"/>
                <input type="button" value="Power Supply" name="powersupply" onclick="location.href='PowerSupplyPage.jsp'"/>
                <input type="button" value="Case" name="case" onclick="location.href='CasePage.jsp'"/>
            </div>
            <div class="content">
                <p>Component Table:</p>
                <%
                    out.println(new HTMLTableCreator().RAMTableCreator(true, "", ""));
                %>
            </div>
            <div class="insidebar">
                <p>Add Component:</p>
                <form action="../AddPage/AddRam.jsp" method="post">
                    <table id="insertTable" border="0">
                        <tr>
                            <td>Brand:</td>
                            <td><input type="text" name="brand"></td>
                        </tr>
                        <tr>
                            <td>Model:</td>
                            <td><input type="text" name="model"></td>
                        </tr>
                        <tr>	
                            <td>RAM Type:</td>
                            <td><input type="text" name="ram_type"></td>
                        </tr>
                        <tr>	
                            <td>Speed:</td>
                            <td><input type="text" name="speed"></td>
                        </tr>
                        <tr>	
                            <td>TDP:</td>
                            <td><input type="text" name="tdp"></td>
                        </tr>
                        <tr>	
                            <td>Number Of Modules:</td>
                            <td><input type="text" name="number_of_modules"></td>
                        </tr>
                        <tr>	
                            <td>Size Of Modules:</td>
                            <td><input type="text" name="size_of_modules"></td>
                        </tr>
                        <tr>	
                            <td>Size:</td>
                            <td><input type="text" name="size"></td>
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
    </body>
</html>
