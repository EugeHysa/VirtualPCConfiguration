<%@ page language="java" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./CSStyles/LoginStyle.css">
        <link rel="icon" href="./../../CSStyles/projectIcon.png" type="image/png"/>
        <title>Create an Account</title>
    </head>
    <body>
        <div class="login-page">
            <div class="form">
                <form class="register-form" action="registration.jsp">
                    <h1>Create an Account</h1>
                    <input type="text" name="uname" id="uname" placeholder="Username..."/>
                    <input type="password" name="pass" id="pass" placeholder="Password..."/>
                    <button>Sign Up</button>
                    <p class="message">Already registered?! <a href="CustomerLogin.jsp">Sign In</a></p>
                </form>
            </div>
        </div>
    </body>
</html>