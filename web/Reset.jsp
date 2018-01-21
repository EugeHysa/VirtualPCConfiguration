<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">




<%
  
    session.removeAttribute("mbCod");
    session.removeAttribute("cpuCod");
    session.removeAttribute("ramCod");
    session.removeAttribute("gcCod");
    session.removeAttribute("hdCod");
    session.removeAttribute("psCod");
    session.removeAttribute("caseCod");
    session.removeAttribute("price");
    
    
    session.setAttribute("mbCod", "");
    session.setAttribute("cpuCod", "");
    session.setAttribute("ramCod", "");
    session.setAttribute("gcCod", "");
    session.setAttribute("hdCod", "");
    session.setAttribute("psCod", "");
    session.setAttribute("caseCod", "");
    session.setAttribute("price", "");
    
    response.sendRedirect("MainPages/ComponentsPanel/MBSystemPage.jsp");

%>