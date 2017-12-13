<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <title>VIRTUAL</title>
        <link rel="icon" href="./../../CSStyles/projectIcon.png" type="image/png"/>
        <style type="text/css">
            /*Font Import*/
            @import "http://fonts.googleapis.com/css?family=Droid+Serif";
            /*Pagina*/
            html { width: 100%; height: 100%; height: auto; }
            /*Page*/
            body {
                background-image: url("../../CSStyles/Sfondo1.jpg");
                background-repeat: no-repeat;
                background-size: 100% 100%;
                background-attachment: fixed;
            }
            /*Grid*/
            .grid {
            display: grid;
            grid-template-columns: 10% 15% 65% 10%;
            grid-template-rows: 2% 18% 10% 60% 10%;
            grid-template-areas:
                ". . . ."
                ". header header ."
                ". navbar navbar ."
                ". content content ."
                ". footer footer .";
            }
            .header {
                grid-area: header;
                background-color: #74AFAD;
                font-family: bold;
                color: white;
            }
            .navbar {
                grid-area: navbar;
                background-color: #558C89;
                text-align: right;
                color: #D9853B;
            }
            .sidebar {
                grid-area: sidebar;
                background-color: #ECECEA;
            }
            .content {
                grid-area: content;
                width: auto;
                background-color: #ECECEA;
            }
            .footer {
                grid-area: footer;
                background-color: #558C89;
                text-align: right;
                color: #D9853B;
            }
        </style>
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
