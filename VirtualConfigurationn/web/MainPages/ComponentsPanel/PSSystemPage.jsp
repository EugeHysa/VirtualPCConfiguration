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

    String ramcod = (String) request.getSession().getAttribute("ramCod");
    String ramField = null;
    if(ramcod!=null)
    {
        ramField = new ComponentParser().getComponent("RAM", ramcod);
    }
    
    String gccod = (String) request.getSession().getAttribute("gcCod");
    String gcField = null;
    if(gccod!=null)
    {
        gcField = new ComponentParser().getComponent("GRAPHICS_CARD", gccod);
    }
    
    String hdcod = request.getParameter("hdCod");
    request.getSession().setAttribute("hdCod", hdcod);
    
    confSave.setHDCod(hdcod);
    session.setAttribute("confSave", confSave);
    String hdField = null;
    if(hdcod!=null)
    {
        hdField = new ComponentParser().getComponent("HDRIVE", hdcod);
    }
    
    Double price = Double.parseDouble(request.getParameter("price"));
    
    
%>








<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to V I R T U A L</title>

        <link rel="stylesheet" type="text/css" href="./../../CSStyles/BuildSystemStyle.css">

            </script>

       
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
                <tr><label>Motherboard:</label><input type="text" id="mbField" value="<% if(mbField!=null) out.print(mbField.replace("-CC-", " ")); %>" disabled="disabled"></tr><br>
                <tr><label>Cpu:</label><input type="text" id="cpuField" value="<% if(cpuField!=null) out.print(cpuField.replace("-CC-", " ")); %>" disabled="disabled"></tr><br>
                <tr><label>Ram:</label><input type="text" id="ramField" value="<% if(ramField!=null) out.print(ramField.replace("-CC-", " ")); %>" disabled="disabled"></tr><br>
                <tr><label>Graphic Card:</label><input type="text" id="gcField" value="<%if(gcField!=null) out.print(gcField.replace("-CC-", " "));%>" disabled="disabled"></tr><br>
                <tr><label>Hard Disk:</label><input type="text" id="hdField" value="<%if(hdField!=null) out.print(hdField.replace("-CC-", " "));%>" disabled="disabled"></tr><br>
                <tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"><input type="text" class="hidden" value="<% if(price!=null) out.print(price); %>" id="psPrice"></tr><br>
                <tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"></tr><br><hr>
                <tr><label>Price:</label><input type="text" id="priceField" value="<% if(price!=null) out.print(price); %>" disabled="disabled"><br></tr>
            </table>
        </div>
        <div class="content">
            
                <!-- Progressbar -->
                <ul id="progressbar">
                    <li id="active6">PS</li>
                </ul>
                <!-- Fieldsets -->


<fieldset id="first">
                
                    <!-- Loading HDisk components in a table-->
                    
                         <%
                    
                            out.println(new HTMLTableCreator().createPS(false));

                         %>
 
      

                         
                         <script>
                    var psIndex;
                    var tablePS = document.getElementById("table");
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
                            document.getElementById("priceField").value = (parseFloat(document.getElementById("psPrice").value)+parseFloat(this.cells[7].innerHTML)).toFixed(2);
                            document.getElementById("psCod").value = this.cells[8].innerHTML;
                            document.getElementById("price").value = document.getElementById("priceField").value;
                         };
                    }
                    </script>
            </fieldset>
                  
                         <form action="CaseSystemPage.jsp" method="POST">
                        
                        <input type="hidden" id="psCod" name="psCod"/>
                        <input type="hidden" id="price" name="price"/>
                        <input type="submit" value="Next"/>
                        
                        
                    </form>
                         
                         
                         <a href="javascript:history.go(-1)" onMouseOver="document.referrer; return true;"><input type="button" value="Previous"></a>
	</div>
        <div class="footer">  <input  type="button"  value=" Admin_Mode" name=" Admin_Mode" onclick="openPage('indexadmin.jsp')"/>
        </div>
    </div>
    </body>
</html>
