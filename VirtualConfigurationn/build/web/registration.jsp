<%@ page language="java" %>
<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtualconfiguration",
            "root", "Prove");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("insert into customerlogin ( Username, Pass) values ('" + user + "','" + pwd + "')");
    if (i > 0) {
        session.setAttribute("userid", user);
        response.sendRedirect("RegSuccessful.jsp");
        out.print("Registration Successfull!"+"<a href='CustomerLogin.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("CustomerLogin.jsp");
    }
%>