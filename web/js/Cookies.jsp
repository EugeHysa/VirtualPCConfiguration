<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="JSPElements.*" %>

<%
    String str = "";
    str = new CookiesHandler().getCookie("nnn", request);
    System.out.println(str);
%>
<script>
    document.cookie = "nnn=000000";
</script>