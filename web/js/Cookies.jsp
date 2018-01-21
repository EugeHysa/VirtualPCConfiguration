<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="JSPElements.*" %>

<%
    


    String str = "";
    
    str = new CookiesHandler().getCookie("n0nn", request);
    System.out.println(str);
%>





<script>
    
    document.cookie = "nnn=vv";
    
    
    
</script>