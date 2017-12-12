<%@page import="Components.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>


<%
    ConfigurationSave confSave = new ConfigurationSave();
    session.setAttribute("confSave", confSave);
    
    String mbcod = null;
    Double price = null /*Double.parseDouble(request.getParameter("price"))*/;
    if(request.getSession().getAttribute("mbCod")!=null && request.getSession().getAttribute("price")!=null)
    {
        mbcod = (String) request.getSession().getAttribute("mbCod");
        price = (Double) request.getSession().getAttribute("price");
    }
    String retStr = null;
    if(mbcod != null){
    retStr = new ComponentParser().getComponent("MOTHERBOARD", mbcod);                                
    }

    

%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to V I R T U A L</title>
        <link rel="stylesheet" type="text/css" href="./../../CSStyles/BuildSystemStyle.css">
    </head>
    <body>        
        
        <div class="grid">
            <div class="header">BANNER</div>
                <div class="navbar">  
                    <input  type="button"  value="SIGN-IN" name="sign-in" onclick="location.href='./../../CustomerLogin.jsp'"/>
                    <input type="button" value="SIGN-UP" name="sign-up" onclick="location.href='reg.jsp'"/>
                    
                    <%//Unsuccess of login
                        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                    %>
                    You are not logged in
                    <%} else {
                    %>
                    Welcome
                    <%=session.getAttribute("userid")%>
                    <a href='logout.jsp'>
                    Log out
                    </a>
                    <%
                        }
                    %>
                    
                    <!--a href="/VirtualConfigurationn/CustomerLogin.jsp?from=${pageContext.request.requestURI}">Login</a-->
                    
                </div>
                <div class="sidebar">
                    <table id="configTable" border="0">
                        <tr><label>Motherboard:</label><input type="text" id="mbField" disabled="disabled" value="<% String o = "";  if((o=retStr)!=null){ out.print(o.replace("-CC-", " "));}else{out.print("");} %>"></tr><br>
                        <tr><label>Cpu:</label><input type="text" id="cpuField" disabled="disabled"></tr><br>
                        <tr><label>Ram:</label><input type="text" id="ramField" disabled="disabled"></tr><br>
                        <tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled"></tr><br>
                        <tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled"></tr><br>
                        <tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"></tr><br>
                        <tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"></tr><br><hr>
                        <tr><label>Price:</label><input type="text" id="priceField" disabled="disabled" value="<% if(price!=null) out.println(price);%>" ><br></tr>
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
                            out.println(new HTMLTableCreator().createMotherboard(false));
                            
                            
                        %>
                        <!--Sending data to next page-->
                        

                        
                        <script>
                            var mbIndex;
                            
                            //var urlForward;
                            if(document.getElementById("mbField").value != null || document.getElementById("mbField").value != "")
                            {
                               
                               // urlForward = "MBSystemPage.jsp";
                            }
                            else
                            {
                               
                            }
                            //else{
                                
                            //urlForward = "CPUSystemPage.jsp?cod=" + document.getElementById("mycod").value + "&priceField="+ document.getElementById("priceField").value;
                            //}
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
                                    document.getElementById("mbField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                                    
                                    document.getElementById("mbCod").value = this.cells[10].innerHTML;
                                    document.getElementById("price").value = this.cells[9].innerHTML;
                                    document.getElementById("priceField").value = this.cells[9].innerHTML;
                                    document.getElementById("nextbtn").disabled = false;
                                    
                                    //urlForward="CPUSystemPage.jsp?cod=" + this.cells[10].innerHTML +"&priceField="+ this.cells[9].innerHTML;
                                    
                                };
                                
                            }
                        </script>
                        </fieldset>
                        
                        
                        
                        <form action="CPUSystemPage.jsp" method="POST">
                            
                            <input type="hidden" id="mbCod" name ="mbCod" value="<% if(mbcod!=null) out.print(mbcod); %>"/>
                            <input type="hidden" id="price" name ="price" value="<% if(price!=null) out.print(price); %>"/>
                            <input type="submit" disabled="" id="nextbtn" value="Next"/>
                            
                            
                            
                        </form>
                        
                        
                        
<!--input  type="button" value="NEXT" name="next" onclick="location.href=urlForward"-->
                        



                </div>
                <div class="footer">
                    <input  type="button"  value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/>
                </div>
        </div>
    </body>
</html>
