<%@ page import ="java.sql.*" %>
<%@ page language="java" %>

<%
    String useridadm = request.getParameter("uname");    
    String pwdadm = request.getParameter("pass");
    
    Class.forName("com.mysql.jdbc.Driver");
    /*JAMES "root", "12345");*/
    /*ANTONINO "root", "Prove");*/
    /*GIOVANNA "root", "Giovanna26");*/
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualconfiguration","root", "12345");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from ADMINLOGIN where USERNAME='" + useridadm + "' and PASS='" + pwdadm + "'");
    if (rs.next()) {
        
        response.sendRedirect("AdminPanel/CompPage/MotherboardPage.jsp");
        session.setAttribute("useridadm", useridadm);
        out.println("welcome " + useridadm);
        out.println("<a href='logout.jsp'>Log out</a>");
    } else {
        out.println("Invalid password <a href='indexadmin.jsp'>try again</a>");
    }
%>