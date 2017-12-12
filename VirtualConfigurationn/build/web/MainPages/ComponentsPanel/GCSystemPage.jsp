<%@page import="Components.*"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    ConfigurationSave confSave = (ConfigurationSave) session.getAttribute("confSave");
    String mbcod = (String) request.getSession().getAttribute("mbCod");
    String mbField = null;
    if(mbcod!=null)
    {
        mbField = new ComponentParser().getComponent("MOTHERBOARD", mbcod);
    }
    
String cpucod = (String) request.getSession().getAttribute("cpuCod");
    String cpuField = null;
    if(cpucod!=null)
    {
        cpuField = new ComponentParser().getComponent("CPU", cpucod);
    }

    String ramcod = request.getParameter("ramCod");
    request.getSession().setAttribute("ramCod", ramcod);
    
    confSave.setRAMCod(ramcod);
    session.setAttribute("confSave", confSave);
    String ramField = null;
    if(ramcod!=null)
    {
        ramField = new ComponentParser().getComponent("RAM", ramcod);
    }
    
    Double price = Double.parseDouble(request.getParameter("price"));


%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SelectColorRowDBTable</title>

        
	<link rel="stylesheet" type="text/css" href="./../../CSStyles/BuildSystemStyle.css">

       
    </head>
    <body>
    <div class="grid">
        <div class="header">BANNER</div>
        <div class="navbar">  
       <input  type="button"  value="SIGN-IN" name="sign-in" onclick="openPage('CustomerLogin.jsp')"/>
       <input type="button" value="SIGN-UP" name="sign-up" onclick="openPage('reg.jsp')"/>
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
                 %></div>
                 
                 
                 

                <div class="sidebar">
            <table id="configTable" border="0">
                <tr><label>Motherboard:</label><input type="text" id="mbField" value="<% if(mbField!=null) out.print(mbField.replace("-CC-", " ")); %>" disabled="disabled"><input type="text" class="hidden" id="mbPrice"></tr><br>
                <tr><label>Cpu:</label><input type="text" id="cpuField" value="<% if(cpuField!=null) out.print(cpuField.replace("-CC-", " ")); %>" disabled="disabled"><input type="text" class="hidden" id="cpuPrice"></tr><br>
                <tr><label>Ram:</label><input type="text" id="ramField" value="<% if(ramField!=null) out.print(ramField.replace("-CC-", " ")); %>" disabled="disabled"><input type="text" class="hidden" id="ramPrice"></tr><br>
                <tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled"><input type="text" class="hidden" value="<% if(price!=null) out.print(price); %>" id="gcPrice"></tr><br>
                <tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled"><input type="text" class="hidden" id="hdPrice"></tr><br>
                <tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"><input type="text" class="hidden" id="psPrice"></tr><br>
                <tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"><input type="text" class="hidden" id="casePrice"></tr><br><hr>
                <tr><label>Price:</label><input type="text" id="priceField" value="<% if(price!=null) out.print(price); %>" disabled="disabled"><br></tr>
            </table>

        </div>
        <div class="content">
            
                <!-- Progressbar -->
                <ul id="progressbar">
                    <li id="active4">GCard</li>
                </ul>
                <!-- Fieldsets -->


<fieldset id="first">
                
                    <!-- Loading GCard components in a table-->
                    
                         <%
                    
                            out.println(new HTMLTableCreator().createGCard(false));

                         %>
 

                         
                <script>
                    var gcIndex;
                    var tableGC = document.getElementById("table");
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
                            document.getElementById("priceField").value = (parseFloat(document.getElementById("gcPrice").value) + parseFloat(this.cells[8].innerHTML)).toFixed(2);
                            document.getElementById("gcCod").value = this.cells[9].innerHTML;
                            document.getElementById("price").value = document.getElementById("priceField").value;
                         };
                    }
                    </script>
                    
                    
                    
                    <form action="HDSystemPage.jsp" method="POST">
                        
                        <input type="hidden" id="gcCod" name="gcCod"/>
                        <input type="hidden" id="price" name="price"/>
                        <input type="submit" value="Next"/>
                        
                        
                    </form>
                    
                    
                    <a href="javascript:history.go(-1)" onMouseOver="document.referrer; return true;"><input type="button" value="Previous"></a>
            </fieldset>
                  
	</div>
        <div class="footer">  <input  type="button"  value=" Admin_Mode" name=" Admin_Mode" onclick="openPage('indexadmin.jsp')"/>
        </div>
    </div>
    </body>
</html>
