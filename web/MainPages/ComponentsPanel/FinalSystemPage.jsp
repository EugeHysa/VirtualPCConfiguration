<%@ page import="JSPElements.*"%>
<%@ page import="Components.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
    
    String hdcod = (String) request.getSession().getAttribute("hdCod");
    String hdField = null;
    if(hdcod!=null)
    {
        hdField = new ComponentParser().getComponent("HDRIVE", hdcod);
    }
    
    String pscod = (String) request.getSession().getAttribute("psCod");
    String psField = null;
    if(pscod!=null){
        psField = new ComponentParser().getComponent("POWER_SUPPLY", pscod);
    }
    
    String casecod = (String) request.getParameter("caseCod");
    request.getSession().setAttribute("caseCod", casecod);
    
    String caseField = null;
    if(casecod!=null){
        caseField = new ComponentParser().getComponent("PCCASE", casecod);
    }
    
    Double price = Double.parseDouble(request.getParameter("price"));
%>
<!DOCTYPE html>
<html>
    <head>
        <title>VIRTUAL</title>
        <link rel="icon" href="./../../CSStyles/projectIcon.png" type="image/png"/>
        <link rel="stylesheet" type="text/css" href="./../../CSStyles/FinalPage.css">
    </head>
    <body>
        <div class="grid">
            <div class="header">BANNER</div>
            <div class="navbar">
                <%//Success of login
                if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                %>
                    You are not logged in
                    <input type="button" value="SIGN-IN" name="sign-in" onclick="location.href='../../CustomerLogin.jsp'"/>
                    <input type="button" value="SIGN-UP" name="sign-up" onclick="location.href='../../reg.jsp'"/>
                <%} 
                else {%>
                    Welcome <%=session.getAttribute("userid")%>
                    <input type="button" value="LOGOUT" name="sign-in" onclick="location.href='../../logout.jsp'"/>
                <%}%>
            </div>
            <div class="content">
                <center>
                <p class="description">Your Building:
                    <table>
                        <tr><label>Motherboard:</label><input type="text" id="mbField" value="<% if(mbField!=null) out.print(mbField.replace("-CC-", " ")); %>" disabled="disabled"></tr><br>
                        <tr><label>Cpu:</label><input type="text" id="cpuField" value="<% if(cpuField!=null) out.print(cpuField.replace("-CC-", " ")); %>" disabled="disabled"></tr><br>
                        <tr><label>Ram:</label><input type="text" id="ramField" value="<% if(ramField!=null) out.print(ramField.replace("-CC-", " ")); %>" disabled="disabled"></tr><br>
                        <tr><label>Graphic Card:</label><input type="text" id="gcField" value="<%if(gcField!=null) out.print(gcField.replace("-CC-", " "));%>" disabled="disabled"></tr><br>
                        <tr><label>Hard Disk:</label><input type="text" id="hdField" value="<%if(hdField!=null) out.print(hdField.replace("-CC-", " "));%>" disabled="disabled"></tr><br>
                        <tr><label>Power Supply:</label><input type="text" id="psField" value="<%if(psField!=null) out.print(psField.replace("-CC-", " "));%>" disabled="disabled"></tr><br>
                        <tr><label>Case:</label><input type="text" id="caseField" value="<%if(caseField!=null) out.print(caseField.replace("-CC-", " "));%>" disabled="disabled"></tr><br><hr>
                        <tr><label>Price:</label><input type="text" id="priceField" value="<% if(price!=null) out.print(price); %>" disabled="disabled"><br></tr>
                    </table>
                </p>
                <form action="AddBuild.jsp" method="post"><button class="btn"><span>Save it!</span><br></button></form>
                <a href="javascript:history.go(-1)" onMouseOver="document.referrer; return true;"><input type="button" value="Previous"></a>
                </center>
            </div>
            <div class="footer">
                <input type="button" value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/>
                <input type="button" value="Restart" name="RestartConfig" onclick="location.href='../../index.html'"/>
            </div>
        </div>
    </body>
</html>
