<%@ page import ="java.sql.*" %>
<%@ page language="java" %>

<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    /*JAMES "root", "12345");*/
    /*ANTONINO "root", "Prove");*/
    /*GIOVANNA "root", "Giovanna26");*/
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualconfiguration","root", "Prove");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from CustomerLogin where USERNAME='" + userid + "' and PASS='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
    } else {
        out.println("Invalid password <a href='CustomerLogin.jsp'>try again</a>");
    }
%>
<script>window.history.go(-2);</script>