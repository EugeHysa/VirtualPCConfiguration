<%@ page import ="java.sql.*" %>
<%@ page language="java" %>

<%
    String useridadm = request.getParameter("uname");    
    String pwdadm = request.getParameter("pass");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Components",
            "root", "untothedead94");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from adminlogin where Username='" + useridadm + "' and Pass='" + pwdadm + "'");
    if (rs.next()) {
        
        response.sendRedirect("AdminPanel/CompPage/MotherboardPage.jsp");
        session.setAttribute("useridadm", useridadm);
        out.println("welcome " + useridadm);
        out.println("<a href='logout.jsp'>Log out</a>");
    } else {
        out.println("Invalid password <a href='indexadmin.jsp'>try again</a>");
    }
%>