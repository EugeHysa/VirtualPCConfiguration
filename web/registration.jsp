<%@ page language="java" %>
<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    /*JAMES "root", "12345");*/
    /*ANTONINO "root", "Prove");*/
    /*GIOVANNA "root", "Giovanna26");*/
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualconfiguration","root", "12345");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("insert into customerlogin (USERNAME, PASS) values ('" + user + "','" + pwd + "')");
    if (i > 0) {
        session.setAttribute("userid", user);
    } else {
        response.sendRedirect("CustomerLogin.jsp");
    }
%>
<script>window.history.go(-2);</script>