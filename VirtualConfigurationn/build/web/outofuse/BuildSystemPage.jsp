<%-- 
    Document   : ProvaSelRowDBTable
    Created on : 20-ott-2017, 16.20.14
    Author     : Deni
--%>
<%@page import="Components.*"%>
<%@page import="Components.PSLoader"%>
<%@page import="Components.HDriveLoader"%>
<%@page import="Components.RAMLoader"%>
<%@page import="Components.GCardLoader"%>
<%@page import="Components.CPULoader"%>
<%@page import="Components.MBLoader"%>
<%@page import="Components.DBConnection"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SelectColorRowDBTable</title>
        
        <script type="text/javascript">
			function openPage(pageURL){
				window.location.href = pageURL;
			}
        
        </script>
        
	<link rel="stylesheet" type="text/css" href="style.css">


        <script src="multi_step_form.js" type="text/javascript"></script>
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
                <tr><label>Motherboard:</label><input type="text" id="mbField"><input type="text" class="hidden" id="mbPrice"></tr><br>
                <tr><label>Cpu:</label><input type="text" id="cpuField"><input type="text" class="hidden" id="cpuPrice"></tr><br>
                <tr><label>Ram:</label><input type="text" id="ramField"><input type="text" class="hidden" id="ramPrice"></tr><br>
                <tr><label>Graphic Card:</label><input type="text" id="gcField"><input type="text" class="hidden" id="gcPrice"></tr><br>
                <tr><label>Hard Disk:</label><input type="text" id="hdField"><input type="text" class="hidden" id="hdPrice"></tr><br>
                <tr><label>Power Supply:</label><input type="text" id="psField"><input type="text" class="hidden" id="psPrice"></tr><br>
                <tr><label>Case:</label><input type="text" id="caseField"><input type="text" class="hidden" id="casePrice"></tr><br><hr>
                <tr><label>Price:</label><input type="text" id="priceField"><br></tr>
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
                    
     out.println(new HTMLTableCreator().MBTableCreator());

                 
                               
                    %>
                    <form action>
                        <input type="hidden" value="ciao" id="swollen">
                <input id="next_btn1" name="next" onclick="next_step1()" type="submit" value="Next">
                </form>
                    <script>
                    var mbIndex;
                    var tableMB = document.getElementById("table1");
                    // get selected row
                    // display selected row data in text input 
                    

                    
                    
                    for(var a = 1; a < tableMB.rows.length; a++)
                    {

                        tableMB.rows[a].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof mbIndex !== "undefined"){
                                tableMB.rows[mbIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            mbIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            document.getElementById("mbField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("mbPrice").value = this.cells[9].innerHTML;
                            
                        };
                        
                        

                    }
                </script>
                <!--<form action="cpujsp.jsp" method="post"><input type="text" id="brannd" name = "brannd" value=""/> <input id="next_btn1" onclick="openPage('cpujsp.jsp')" type="button" value="Next"> </form>-->
                    
                </fieldset>
                <fieldset id="second">
                    <!-- Loading CPU components in a table-->
                    
                                <%
                                    
                                    
                                    out.println(request.getParameter("swollen"));
                                    out.println(new HTMLTableCreator().CPUTableCreator());                                      

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
                            document.getElementById("cpuPrice").value = this.cells[7].innerHTML;
                        };
                        
                        
                        
                    }
                    </script>
                    <input id="pre_btn1" onclick="prev_step1()" type="button" value="Previous">
                    <input id="next_btn2" name="next" onclick="next_step2()" type="button" value="Next">
                </fieldset>
                <fieldset id="third">
                    <!-- Loading RAM components in a table-->
                    <table id="table3" border="1">
                        <tr>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>RAM_Type</th>
                                <th>Speed</th>
                                <th>tdp</th>	
                                <th>Number_Of_Modules</th>
                                <th>Size_Of_Modules</th>
                                <th>Size</th>
                                <th>Price</th>
                        </tr>
                        <%
                             try{
        DBConnection db = new DBConnection();
        RAMLoader rm = new RAMLoader();
        db.Connect();
        db.loadRAM(rm);

        for(int i = 0; i < rm.getSize(); i++)
        {
            String str1 = rm.listBrands().get(i);
            String str2 = rm.listModels().get(i);
            String str3 = rm.listTypes().get(i);
            String str4 = rm.listSpeeds().get(i);
            Integer int1 = rm.listTDPs().get(i);
            Integer int2 = rm.listNOMs().get(i);
            Integer int3 = rm.listSOMs().get(i);
            Integer int4 = rm.listSizes().get(i);
            Double db1 = rm.listPrices().get(i);
            
            out.println("<tr>");
            out.println("<td>"+str1+"</td>");
            out.println("<td>"+str2+"</td>");
            out.println("<td>"+str3+"</td>");
            out.println("<td>"+str4+"</td>");
            out.println("<td>"+int1+"</td>");
            out.println("<td>"+int2+"</td>");
            out.println("<td>"+int3+"</td>");
            out.println("<td>"+int4+"</td>");
            out.println("<td>"+int3+"</td>");
            out.println("<td>"+db1+"</td>");
            out.println("</tr>");
        }										
    }
    catch(SQLException ex){
        out.println("Eccezione SQL.");
    }
                              

                        %>
                </table>
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
                            document.getElementById("ramField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("ramPrice").value = this.cells[8].innerHTML;
                        };
                    }
                    </script>
                    <input id="pre_btn2" onclick="prev_step2()" type="button" value="Previous">
                    <input id="next_btn3" name="next" onclick="next_step3()" type="button" value="Next">
                </fieldset>
                <fieldset id="fourth">
                    <!-- Loading Graphic Card components in a table-->
                    <table id="table4" border="1">
                        <tr>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>Series</th>
                                <th>Chipset</th>
                                <th>Memory</th>
                                <th>Core_Clock</th>
                                <th>TDP</th>	
                                <th>Lenght</th>
                                <th>Price</th>
                        </tr>
                        <%
   try{
        DBConnection db = new DBConnection();
        GCardLoader gc = new GCardLoader();
        db.Connect();
        db.loadGCard(gc);

        for(int i = 0; i < gc.getSize(); i++)
        {
            String str1 = gc.listBrands().get(i);
            String str2 = gc.listModels().get(i);
            String str3 = gc.listSeries().get(i);
            String str4 = gc.listChipsets().get(i);
            Integer int1 = gc.listMemory().get(i);
            Double db1 = gc.listClocks().get(i);
            Integer int2 = gc.listTDPs().get(i);
            Integer int3 = gc.listLength().get(i);
            Double db2 = gc.listPrices().get(i);
           
            
            out.println("<tr>");
            out.println("<td>"+str1+"</td>");
            out.println("<td>"+str2+"</td>");
            out.println("<td>"+str3+"</td>");
            out.println("<td>"+str4+"</td>");
            out.println("<td>"+int1+"</td>");
            out.println("<td>"+db1+"</td>");
            out.println("<td>"+int2+"</td>");
            out.println("<td>"+int3+"</td>");
            out.println("<td>"+db2+"</td>");
            out.println("</tr>");
        }										
    }
    catch(SQLException ex){
        out.println("Eccezione SQL.");
    }
                                

                        %>
                </table>
                    <script>
                    var gcIndex;
                    var tableGC = document.getElementById("table4");
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
                            document.getElementById("gcPrice").value = this.cells[8].innerHTML;
                        };
                    }
                    </script>
                    <input id="pre_btn3" onclick="prev_step3()" type="button" value="Previous">
                    <input id="next_btn4" name="next" onclick="next_step4()" type="button" value="Next">
                </fieldset>
                <fieldset id="fifth">
                    <!-- Loading Hard Disk components in a table-->
                    <table id="table5" border="1">
                        <tr>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>Series</th>
                                <th>Form</th>
                                <th>Type</th>
                                <th>Size</th>
                                <th>TDP</th>
                                <th>Cache</th>									
                                <th>Price</th>
                        </tr>
                        <%
                        try{
        DBConnection db = new DBConnection();
        HDriveLoader hd = new HDriveLoader();
        db.Connect();
        db.loadHDrive(hd);

        for(int i = 0; i < hd.getSize(); i++)
        {
            String str1 = hd.listBrands().get(i);
	    String str2 = hd.listModels().get(i);
	    String str3 = hd.listSeries().get(i);
	    String str4 = hd.listForms().get(i);
	    String str5 = hd.listTypes().get(i);				
	    Integer int1 = hd.listSizes().get(i);
            Integer int2 = hd.listTDPs().get(i);
            Integer int3 = hd.listCaches().get(i); 
	    Double db1 = hd.listPrices().get(i);
	    out.println("<tr>");
	    out.println("<td>"+str1+"</td>");
            out.println("<td>"+str2+"</td>");
            out.println("<td>"+str3+"</td>");
            out.println("<td>"+str4+"</td>");
            out.println("<td>"+str5+"</td>");
            out.println("<td>"+int1+"</td>");
            out.println("<td>"+int2+"</td>");
            out.println("<td>"+int3+"</td>");
            out.println("<td>"+db1+"</td>");
            out.println("</tr>");
        }										
    }
    catch(SQLException ex){
        out.println("Eccezione SQL.");
    }
                            
                            
                           
                        %>
                </table>
                    <script>
                    var hdIndex;
                    var tableHD = document.getElementById("table5");
                    // get selected row
                    // display selected row data in text input        
                    for(var i = 1; i < tableHD.rows.length; i++)
                    {

                        tableHD.rows[i].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof hdIndex !== "undefined"){
                                tableHD.rows[hdIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            hdIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            document.getElementById("hdField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("hdPrice").value = this.cells[8].innerHTML;
                        };
                    }
                    </script>
                    <input id="pre_btn4" onclick="prev_step4()" type="button" value="Previous">
                    <input id="next_btn5" name="next" onclick="next_step5()" type="button" value="Next">
                </fieldset>
                <fieldset id="sixth">
                    <!-- Loading Power Supply components in a table-->
                    <table id="table6" border="1">
                        <tr>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>Series</th>
                                <th>Form</th>
                                <th>Efficiency</th>
                                <th>TDP</th>
                                <th>Modular</th>
                                <th>Price</th>
                        </tr>
                    
                    <%
                        try{
        DBConnection db = new DBConnection();
        PSLoader ps = new PSLoader();
        db.Connect();
        db.loadPS(ps);

        for(int i = 0; i < ps.getSize(); i++)
        {
            String str1 = ps.listBrands().get(i);
            String str2 = ps.listModels().get(i);
            String str3 = ps.listSeries().get(i);
            String str4 = ps.listForms().get(i);
            String str5 = ps.listEfficiencies().get(i);
            Integer int1 = ps.listMaxTDPs().get(i);
            String str6 = ps.listModulars().get(i);
            Double db1 = ps.listPrices().get(i);
            
            out.println("<tr>");
            out.println("<td>"+str1+"</td>");
            out.println("<td>"+str2+"</td>");
            out.println("<td>"+str3+"</td>");
            out.println("<td>"+str4+"</td>");
            out.println("<td>"+str5+"</td>");
            out.println("<td>"+int1+"</td>");
            out.println("<td>"+str6+"</td>");
            out.println("<td>"+db1+"</td>");
            out.println("</tr>");
        }										
    }
    catch(SQLException ex){
        out.println("Eccezione SQL.");
    }
                        
                        
                        
                     
                        %>
                    </table>
                    <script>
                    var psIndex;
                    var tablePS = document.getElementById("table6");
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
                            document.getElementById("psPrice").value = this.cells[7].innerHTML;
                        };
                    }
                    </script>
                    <input id="pre_btn5" onclick="prev_step5()" type="button" value="Previous">
                    <input id="next_btn6" name="next" onclick="next_step6()" type="button" value="Next">
                </fieldset>
                <fieldset id="seventh">
                    <!-- Loading Case components in a table-->
                    <table id="table7" border="1">
                        <tr>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>Type</th>
                                <th>Color</th>
                                <th>MotherBoard_Compatibili</th>
                                <th>Max_HDrive_Length</th>
                                <th>Price</th>
                        </tr>
                    
                    <%
                        
                        try{
        DBConnection db = new DBConnection();
        CaseLoader c = new CaseLoader();
        db.Connect();
        db.loadCase(c);

        for(int i = 0; i < c.getSize(); i++)
        {
            String str1 = c.listBrands().get(i);
            String str2 = c.listModels().get(i);
            String str3 = c.listTypes().get(i);
            String str4 = c.listColors().get(i);
            String str5 = c.listMB_Comp().get(i);
            Double db1 = c.listMax_hd_Len().get(i);
            Double db2 = c.listPrices().get(i);
            
            out.println("<tr>");
            out.println("<td>"+str1+"</td>");
            out.println("<td>"+str2+"</td>");
            out.println("<td>"+str3+"</td>");
            out.println("<td>"+str4+"</td>");
            out.println("<td>"+str5+"</td>");
            out.println("<td>"+db1+"</td>");
            out.println("<td>"+db2+"</td>");
            out.println("</tr>");
        }										
    }
    catch(SQLException ex){
        out.println("Eccezione SQL.");
    }
                       
                        %>
                        </table>
                    <script>
                    var caseIndex;
                    var tableCASE = document.getElementById("table7");
                    // get selected row
                    // display selected row data in text input        
                    for(var i = 1; i < tableCASE.rows.length; i++)
                    {

                        tableCASE.rows[i].onclick = function()
                        {
                            //Remove the previous selected row
                            if (typeof caseIndex !== "undefined"){
                                tableCASE.rows[caseIndex].classList.toggle("selected");
                            }
                            //Get the selected row index
                            caseIndex = this.rowIndex;
                            //Add class to the selected row
                            this.classList.toggle("selected");
                            document.getElementById("caseField").value = this.cells[0].innerHTML + " " + this.cells[1].innerHTML;
                            document.getElementById("casePrice").value = this.cells[7].innerHTML;
                        };
                    }
                    </script>
                    <input id="pre_btn6" onclick="prev_step6()" type="button" value="Previous">
                    <input id="next_btn7" name="next" onclick="next_step7()" type="button" value="Next">
                </fieldset>
                <fieldset id="eighth">
                    SAVE YOUR BUILD.
                </fieldset>
            
	</div>
        <div class="footer">  <input  type="button"  value=" Admin_Mode" name=" Admin_Mode" onclick="openPage('indexadmin.jsp')"/>
        </div>
    </div>
    </body>
</html>
