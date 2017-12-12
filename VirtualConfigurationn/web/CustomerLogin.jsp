<%@ page language="java" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
        <link rel="stylesheet" type="text/css" href="./CSStyles/LoginStyle.css">
        
         
    </head>
    <body>
        <div class="login-page">
            <div class="form">
            <form class="login-form" method="post" action="login.jsp">
                <h1>Login</h1>
                <input type="text" name="uname" placeholder="Username..."/>
                <input type="password" name="pass" placeholder="Password..."/>
                <button>Sign In</button>
                <p class="message">Not registered?! <a href="reg.jsp">Create an account!</a></p>
            </form>
          </div>
        </div>
    </body>
</html>
