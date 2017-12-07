<%@ page import ="java.sql.*" %>
<%@ page language="java" %>

<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    /*JAMES "root", "12345");*/
    /*ANTONINO "root", "Prove");*/
    /*GIOVANNA "root", "Giovanna26");*/
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualconfiguration","root", "Giovanna26");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from CustomerLogin where USERNAME='" + userid + "' and PASS='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        %><html><body onload="<script>if(!localStorage.reload) {setTimeout("document.location.reload()",2000);localStorage.reload = 1;}</script></body></html><%
    } else {
        out.println("Invalid password <a href='CustomerLogin.jsp'>try again</a>");
    }
%>