<%@ page import="JSPElements.*"%>
<%@ page import="Components.*"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ConfigurationSave confSave = (ConfigurationSave) session.getAttribute("confSave");
    
    String cpuField=null;
    
    
    Cookie[] cookies = request.getCookies();    
    if (cookies != null) {
    for (Cookie cookie : cookies) {
      if (cookie.getName().equals("mobo")) {
        cpuField = cookie.getValue();
       }
     }
   }
    
    
    String mbcod = request.getParameter("mbCod");
    request.getSession().setAttribute("mbCod", mbcod);
    Double price = Double.parseDouble(request.getParameter("price"));
    
    confSave.setMBCod(mbcod);
    session.setAttribute("confSave", confSave);
    //request.getSession().setAttribute("price", price);
    //if(request.getSession().getAttribute("price")!=null)
    //{
     //   price = (Double) request.getSession().getAttribute("price");
    //}
    
    String input [] = null;
    String brand = null;
    String model = null;
    if(mbcod != null)
    {
        input = new ComponentParser().getComponent("MOTHERBOARD", mbcod).split("-CC-");
        brand = input[0];
        model = input[1];
    }
    //CPU data init. for return case
    
    String cpucod = null;
    if((cpucod = (String) request.getSession().getAttribute("cpuCod"))!=null)
    {
        cpuField = new ComponentParser().getComponent("CPU", cpucod);
    }
%>