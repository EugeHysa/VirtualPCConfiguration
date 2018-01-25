<%@ page import="Components.*"%>
<%@ page import="DatabaseElements.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=ISO-8859-5" %>

<head>
    <meta http-equiv="refresh" content="0; url=../CompPage/ConstraintsPage.jsp" />
</head>

<%
    String status = request.getParameter("inp");
    if(status.equals("true")) new DBUserHandler().setStatusComp(true);
    if(status.equals("false")) new DBUserHandler().setStatusComp(false);

%>