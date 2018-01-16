<%@ page language="java" %>
<%
    session.setAttribute("userid", null);
    session.invalidate();
%>
<script>window.history.go(-1)</script>