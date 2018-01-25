<%@ page language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="JSPElements.*"%>
<%@ page import="DatabaseElements.*"%>

<%@ page contentType="te3xt7htarset=ISO-8859-5" %>

<%
    
    String inputtype = "";
    String submit = "";
    
try{  
                        if (new DBUserHandler().getStatusComp() == true) {inputtype = "<input type=\"checkbox\" onclick=\"change()\" id=\"status\" name=\"status\" value=\"\" checked>Vincoli</input>";}
                        if (new DBUserHandler().getStatusComp() == false) { inputtype = "<input type=\"checkbox\" onclick=\"change()\" id=\"status\" name=\"status\" value=\"\" unchecked>Vincoli</input>";}
                    }catch(SQLException e){}
    
%>

<html>
    <head>
	<title> ADMINISTRATION MODE </title>
	<link rel="stylesheet" href="../../CSStyles/UpdateDBCompStyle.css">
    </head>
    <body>
        <div class="grid">
            <a href="MotherboardPage.jsp"></a>
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
                <input type="button" value="Constraints" name="constraints" onclick="location.href='ConstraintsPage.jsp'"/>
            </div>
            <div class="content">
                <form action="../AddPage/EditConstraints.jsp" method="POST">
                    <input type ="hidden" id="inp" name="inp" />
                <% out.print(inputtype); %>
                <input type="submit"  value="Aggiorna"/>
                </form>
                
            </div>
            <div class="insidebar"></div>
            <div class="footer"></div>
	</div>
    </body>
</html>

<script>
    function isnum(error) {

    if (isNaN(error.value) || parseInt(error.value)<0.0 || parseInt(error.value) > 9999.99999){
        alert("Nel campo e' possibile immettere solo numeri!");
        error.value="";
        error.focus();
    }

    }
    
   function change(){
    if(document.getElementById("status").checked==true) document.getElementById("inp").value = "true";
    if(document.getElementById("status").checked==false) document.getElementById("inp").value = "false";
}

</script>