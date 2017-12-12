<%@page import="Components.*"%>
<%@page import="DatabaseElements.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ConfigurationSave confSave = (ConfigurationSave) session.getAttribute("confSave");
    
    
    
    String mbcod = request.getParameter("mbCod");
    request.getSession().setAttribute("mbCod", mbcod);
    Double price = Double.parseDouble(request.getParameter("price"));
    
    
    confSave.setMBCod(mbcod);
    session.setAttribute("confSave", confSave);
    //request.getSession().setAttribute("price", price);
    //if(request.getSession().getAttribute("price")!=null)
    //{
     //   price = (Double) request.getSession().getAttribute("price");
    //}
    
    String input [] = null;
    String brand = null;
    String model = null;
    if(mbcod != null)
    {
        input = new ComponentParser().getComponent("MOTHERBOARD", mbcod).split("-CC-");
        brand = input[0];
        model = input[1];
    }

    
    
    //CPU data init. for return case
    String cpuField=null;
    String cpucod = null;
    if((cpucod = (String) request.getSession().getAttribute("cpuCod"))!=null)
    {
        cpuField = new ComponentParser().getComponent("CPU", cpucod);
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
		
			<input type="button"  value="SIGN-IN" name="sign-in" onclick="location.href='./../../CustomerLogin.jsp'"/>
			<input type="button" value="SIGN-UP" name="sign-up" onclick="openPage('reg.jsp')"/>

			<%//Success of login
				if((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
	                 %>
        	                You are not logged in
                       
                 	<%} else {
                	%>
	                    Welcome
			<%=
				session.getAttribute("userid")
			%>
			<a href='logout.jsp'>Log out</a>
			<%
				}
			%>
		</div>
		<div class="sidebar">
			<table id="configTable" border="0">
                            <input type="hidden" id="temp" name="temp" value="<% out.print(mbcod); %>">
                            <tr><label>Motherboard:</label><input type="text" value="<% out.println(brand + " " + model); %>"  id="mbField" disabled="disabled"></input> </tr><br>
                        <tr><label>Cpu:</label><input type="text" id="cpuField" value='<% if(cpuField != null) out.print(cpuField.replace("-CC-", " ")); %>' disabled="disabled"><input type="text" class="hidden" value="<% out.print(price); %>" id="cpuPrice"></tr><br>
				<tr><label>Ram:</label><input type="text" id="ramField" disabled="disabled"></tr><br>
				<tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled"></tr><br>
				<tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled"></tr><br>
				<tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"></tr><br>
				<tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"></tr><br><hr>
				<tr><label>Price:</label><input type="text" value="<% out.println(price); %>" id="priceField" disabled="disabled"></input><br></tr>
			</table>
		</div>
		
		<div class="content">
         
                	<fieldset id="first">
                    <!-- Loading CPU components in a table-->
			<%

				out.print(new HTMLTableCreator().createCPU(false, brand, model));
			%>
		</table>   


                    <script>
                        var urlForward;
                        if(document.getElementById("cpuField").value == null || document.getElementById("cpuField").value == "")
                            {
                               // urlForward = "CPUSystemPage.jsp?cod="+document.getElementById("temp").value+"&priceField="+document.getElementById("priceField").value;
                            }
                            else
                            {
                               // urlForward = RAMSystem
                            }
                            
                        
                        urlBackward = "MBSystemPage.jsp";
                        //urlBackward = "MBSystemPage.jsp?cod=" + document.getElementById("temp").value + "&priceField="+ document.getElementById("cpuPrice").value;
                    var cpuIndex;
                    var tableCPU = document.getElementById("table1");
                    // get selected row
                    // display selected row data in text input        
                    for(var i = 1; i < tableCPU.rows.length; i++)
                    {

                        tableCPU.rows[i].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof cpuIndex !== "undefined"){
                                tableCPU.rows[cpuIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            cpuIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            
                            document.getElementById("cpuField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("cpuCod").value = this.cells[7].innerHTML;
                            document.getElementById("priceField").value = (parseFloat(document.getElementById("cpuPrice").value) + parseFloat(this.cells[6].innerHTML)).toFixed(2);
                            document.getElementById("price").value = document.getElementById("priceField").value;
                            document.getElementById("nextbtn").disabled = false;
                            //urlForward="RAMSystemPage.jsp?mbcod="+ document.getElementById("temp").value +"&cpucod=" + this.cells[7].innerHTML +"&priceField="+ document.getElementById("priceField").value;
                        };
                        
                        
                        
                    }
                    </script>



                    <form action="RAMSystemPage.jsp" method="POST">
                            
                            <input type="hidden" id="cpuCod" name ="cpuCod" value="<% if(cpucod!=null) out.print(cpucod); %>"/>
                            <input type="hidden" id="price" name ="price" value="<% if(price!=null) out.print(price); %>"/>
                            <input type="submit" disabled="" id="nextbtn" value="Next"/>
                            
                            
                            
                        </form>
                    
                    
                    <a href="javascript:history.go(-1)" onMouseOver="self.status.referrer; return true;"><input type="button" value="Previous"></a>
<!--input  type="button" value="Previous" name="previous" onclick="location.href=urlBackward"/-->

<!--input  type="button" value="Next" name="next" onclick="location.href=urlForward"/-->



                </fieldset>

	</div>

        <div class="footer">  <a href='../../indexadmin.jsp'>ADMIN-MODE</a>
        </div>
    </div>
    </body>
</html>
