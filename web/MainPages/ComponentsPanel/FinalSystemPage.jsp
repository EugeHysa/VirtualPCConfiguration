<%@ page import="JSPElements.*"%>
<%@ page import="Components.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
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
                <h1>SAVE YOUR CONFIGURATION</h1>
                <a href="javascript:history.go(-1)" onMouseOver="document.referrer; return true;"><input type="button" value="Previous"></a>
            </div>
            <div class="footer">
                <input type="button" value="Admin_Mode" name="Admin_Mode" onclick="location.href='../../indexadmin.jsp'"/>
                <input type="button" value="Restart" name="RestartConfig" onclick="location.href='../../index.html'"/>
            </div>
        </div>
    </body>
</html>
