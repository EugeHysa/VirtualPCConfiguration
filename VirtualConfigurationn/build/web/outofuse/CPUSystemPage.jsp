<%@page import="Components.*"%>
<%@page import="DatabaseElements.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SelectColorRowDBTable</title>
        

	<link rel="stylesheet" type="text/css" href="./CSStyles/BuildSystemStyle.css">
          <script type="text/javascript">
            

        
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
        
                <tr><label>Motherboard:</label><input type="text" value="<% out.println(request.getParameter("BRAND")+ " " + request.getParameter("MODEL")); %>"  id="mbField"></input> <input type="text" class="hidden" value="<%out.print(request.getParameter("PRICE"));%>" id="mbPrice"></tr><br>
                <tr><label>Cpu:</label><input type="text" id="cpuField"><input type="text" class="hidden" id="cpuPrice" value="<%out.println(request.getParameter("PRICE")); %>"></tr><br>
                <tr><label>Ram:</label><input type="text" id="ramField"><input type="text" class="hidden" id="ramPrice"></tr><br>
                <tr><label>Graphic Card:</label><input type="text" id="gcField"><input type="text" class="hidden" id="gcPrice"></tr><br>
                <tr><label>Hard Disk:</label><input type="text" id="hdField"><input type="text" class="hidden" id="hdPrice"></tr><br>
                <tr><label>Power Supply:</label><input type="text" id="psField"><input type="text" class="hidden" id="psPrice"></tr><br>
                <tr><label>Case:</label><input type="text" id="caseField"><input type="text" class="hidden" id="casePrice"></tr><br><hr>
                <tr><label>Price:</label><input type="text" id="cpupriceField" value="<%out.println(request.getParameter("PRICE")); %>"><br></tr>
            
            </table>
        </div>
        <div class="content">
         
            <!-- Progressbar -->
                <ul id="progressbar">
                    
                    <li id="active2">Cpu</li>
                    
                </ul>
               
            <fieldset id="first">
                    <!-- Loading CPU components in a table-->
                               <%
                                  
                                    String brand = request.getParameter("BRAND");
                                    String model = request.getParameter("MODEL");

                                                           
        
        out.println(new HTMLTableCreator().CPUTableCreator(false));
        
                

                                %>
               

      
         <form action="Carrello.jsp" method="GET">
        
        <input type="hidden" id="CPUBRAND" name = "CPUBRAND"/>
        <input type="hidden" id="CPUMODEL" name = "CPUMODEL"/>
        <input type="text"   id="CPUPRICE" name = "CPUPRICE"/>
        
        
        <input type="hidden" value="<%out.print(request.getParameter("BRAND"));%>" id="mbbrand" name="mbbrand">
        <input type="hidden" value="<%out.print(request.getParameter("MODEL"));%>" id="mbmodel" name="mbmodel">
        <input type="text"   value="<%out.print(request.getParameter("PRICE"));%>" id="mbprice" name="mbprice">
        <input type="submit" value="Next"> 
        </form> 
        
        <%
            
            String mbbrand = request.getParameter("BRAND");
            String mbmodel = request.getParameter("MODEL");
            String user = request.getParameter("userid");
            Carrello.getMBFIELD(mbbrand, mbmodel);
            
            
            %>
        
        <script>
                    var cpuIndex;
                    var tableCPU = document.getElementById("table2");
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
                            
                            document.getElementById("CPUBRAND").value = this.cells[0].innerHTML;
                            document.getElementById("CPUMODEL").value = this.cells[1].innerHTML;
                            //document.getElementById("CPUPRICE").value = this.cells[6].innerHTML; 
                            
                            document.getElementById("cpupriceField").value = document.getElementById("cpuPrice").value;
                            document.getElementById("cpupriceField").value = parseFloat(document.getElementById("cpupriceField").value) + parseFloat(this.cells[6].innerHTML);
                            document.getElementById("CPUPRICE").value = document.getElementById("cpupriceField").value;
                            
                            document.getElementBYId("cpuField").value = document.getElementById("returncpu").value;
          
              
           
    };
                        
                    } 
                    
                    </script>
                    
 <form id="form" action="MBSystemPage.jsp">
<input id="mbField" name="mbField" value="<%out.print(request.getParameter("BRAND") + " " +request.getParameter("MODEL"));%>" type="hidden">
<input id="mbPrice" name="mbPrice" value="<%out.print(request.getParameter("PRICE"));%>" type="hidden">
</form>

<a href="javascript: document.getElementById('mbField').value; document.getElementById('mbPrice').value; document.getElementById('form').submit();"> <input type="button" value="Previous"></a>

 </fieldset>
                

	</div>

        <div class="footer">  <input  type="button"  value="Admin_Mode" name=" Admin_Mode" onclick="openPage('indexadmin.jsp')"/>
        </div>
    </div>
    </body>
</html>
