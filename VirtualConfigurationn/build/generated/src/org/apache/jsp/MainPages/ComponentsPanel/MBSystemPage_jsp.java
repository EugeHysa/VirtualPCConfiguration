package org.apache.jsp.MainPages.ComponentsPanel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Components.*;
import java.sql.*;

public final class MBSystemPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    ConfigurationSave confSave = new ConfigurationSave();
    session.setAttribute("confSave", confSave);
    
    String mbcod = null;
    Double price = null /*Double.parseDouble(request.getParameter("price"))*/;
    if(request.getSession().getAttribute("mbCod")!=null && request.getSession().getAttribute("price")!=null)
    {
        mbcod = (String) request.getSession().getAttribute("mbCod");
        price = (Double) request.getSession().getAttribute("price");
    }
    String retStr = null;
    if(mbcod != null){
    retStr = new ComponentParser().getComponent("MOTHERBOARD", mbcod);                                
    }

    


      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    \n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Welcome to V I R T U A L</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"./../../CSStyles/BuildSystemStyle.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>        \n");
      out.write("        \n");
      out.write("        <div class=\"grid\">\n");
      out.write("            <div class=\"header\">BANNER</div>\n");
      out.write("                <div class=\"navbar\">  \n");
      out.write("                    <input  type=\"button\"  value=\"SIGN-IN\" name=\"sign-in\" onclick=\"location.href='./../../CustomerLogin.jsp'\"/>\n");
      out.write("                    <input type=\"button\" value=\"SIGN-UP\" name=\"sign-up\" onclick=\"location.href='reg.jsp'\"/>\n");
      out.write("                    \n");
      out.write("                    ");
//Unsuccess of login
                        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                    
      out.write("\n");
      out.write("                    You are not logged in\n");
      out.write("                    ");
} else {
                    
      out.write("\n");
      out.write("                    Welcome\n");
      out.write("                    ");
      out.print(session.getAttribute("userid"));
      out.write("\n");
      out.write("                    <a href='logout.jsp'>\n");
      out.write("                    Log out\n");
      out.write("                    </a>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("                    \n");
      out.write("                    <!--a href=\"/VirtualConfigurationn/CustomerLogin.jsp?from=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.requestURI}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">Login</a-->\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"sidebar\">\n");
      out.write("                    <table id=\"configTable\" border=\"0\">\n");
      out.write("                        <tr><label>Motherboard:</label><input type=\"text\" id=\"mbField\" disabled=\"disabled\" value=\"");
 String o = "";  if((o=retStr)!=null){ out.print(o.replace("-CC-", " "));}else{out.print("");} 
      out.write("\"></tr><br>\n");
      out.write("                        <tr><label>Cpu:</label><input type=\"text\" id=\"cpuField\" disabled=\"disabled\"></tr><br>\n");
      out.write("                        <tr><label>Ram:</label><input type=\"text\" id=\"ramField\" disabled=\"disabled\"></tr><br>\n");
      out.write("                        <tr><label>Graphic Card:</label><input type=\"text\" id=\"gcField\" disabled=\"disabled\"></tr><br>\n");
      out.write("                        <tr><label>Hard Disk:</label><input type=\"text\" id=\"hdField\" disabled=\"disabled\"></tr><br>\n");
      out.write("                        <tr><label>Power Supply:</label><input type=\"text\" id=\"psField\" disabled=\"disabled\"></tr><br>\n");
      out.write("                        <tr><label>Case:</label><input type=\"text\" id=\"caseField\" disabled=\"disabled\"></tr><br><hr>\n");
      out.write("                        <tr><label>Price:</label><input type=\"text\" id=\"priceField\" disabled=\"disabled\" value=\"");
 if(price!=null) out.println(price);
      out.write("\" ><br></tr>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"content\">\n");
      out.write("                    <!-- Progressbar -->\n");
      out.write("                    <ul id=\"progressbar\">\n");
      out.write("                        <li id=\"active1\">Motherboard</li>\n");
      out.write("                        <li id=\"active2\">Cpu</li>\n");
      out.write("                        <li id=\"active3\">Ram</li>\n");
      out.write("                        <li id=\"active4\">Graphic Card</li>\n");
      out.write("                        <li id=\"active5\">Hard Disk</li>\n");
      out.write("                        <li id=\"active6\">Power Supply</li>\n");
      out.write("                        <li id=\"active7\">Case</li>\n");
      out.write("                    </ul>\n");
      out.write("                        <!-- Fieldsets -->\n");
      out.write("                        <fieldset id=\"first\">\n");
      out.write("                        <!-- Loading Motherboard components in a table-->\n");
      out.write("                        ");

                            out.println(new HTMLTableCreator().createMotherboard(false));
                            
                            
                        
      out.write("\n");
      out.write("                        <!--Sending data to next page-->\n");
      out.write("                        \n");
      out.write("\n");
      out.write("                        \n");
      out.write("                        <script>\n");
      out.write("                            var mbIndex;\n");
      out.write("                            \n");
      out.write("                            //var urlForward;\n");
      out.write("                            if(document.getElementById(\"mbField\").value != null || document.getElementById(\"mbField\").value != \"\")\n");
      out.write("                            {\n");
      out.write("                               \n");
      out.write("                               // urlForward = \"MBSystemPage.jsp\";\n");
      out.write("                            }\n");
      out.write("                            else\n");
      out.write("                            {\n");
      out.write("                               \n");
      out.write("                            }\n");
      out.write("                            //else{\n");
      out.write("                                \n");
      out.write("                            //urlForward = \"CPUSystemPage.jsp?cod=\" + document.getElementById(\"mycod\").value + \"&priceField=\"+ document.getElementById(\"priceField\").value;\n");
      out.write("                            //}\n");
      out.write("                            var tableMB = document.getElementById(\"table1\");\n");
      out.write("                            // get selected row and display selected row data in text input\n");
      out.write("                            for(var a = 1; a < tableMB.rows.length; a++)\n");
      out.write("                            {\n");
      out.write("                                tableMB.rows[a].onclick = function()\n");
      out.write("                                {\n");
      out.write("                                    //Remove the previous selected row\n");
      out.write("                                    if (typeof mbIndex !== \"undefined\")\n");
      out.write("                                    {\n");
      out.write("                                        tableMB.rows[mbIndex].classList.toggle(\"selected\");\n");
      out.write("                                    }\n");
      out.write("                                    //Get the selected row index\n");
      out.write("                                    mbIndex = this.rowIndex;\n");
      out.write("                                    //Add class to the selected row\n");
      out.write("                                    this.classList.toggle(\"selected\");\n");
      out.write("                                    document.getElementById(\"mbField\").value = this.cells[0].innerHTML + \" \" + this.cells[1].innerHTML;\n");
      out.write("                                    \n");
      out.write("                                    document.getElementById(\"mbCod\").value = this.cells[10].innerHTML;\n");
      out.write("                                    document.getElementById(\"price\").value = this.cells[9].innerHTML;\n");
      out.write("                                    document.getElementById(\"priceField\").value = this.cells[9].innerHTML;\n");
      out.write("                                    document.getElementById(\"nextbtn\").disabled = false;\n");
      out.write("                                    \n");
      out.write("                                    //urlForward=\"CPUSystemPage.jsp?cod=\" + this.cells[10].innerHTML +\"&priceField=\"+ this.cells[9].innerHTML;\n");
      out.write("                                    \n");
      out.write("                                };\n");
      out.write("                                \n");
      out.write("                            }\n");
      out.write("                        </script>\n");
      out.write("                        </fieldset>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        <form action=\"CPUSystemPage.jsp\" method=\"POST\">\n");
      out.write("                            \n");
      out.write("                            <input type=\"hidden\" id=\"mbCod\" name =\"mbCod\" value=\"");
 if(mbcod!=null) out.print(mbcod); 
      out.write("\"/>\n");
      out.write("                            <input type=\"hidden\" id=\"price\" name =\"price\" value=\"");
 if(price!=null) out.print(price); 
      out.write("\"/>\n");
      out.write("                            <input type=\"submit\" disabled=\"\" id=\"nextbtn\" value=\"Next\"/>\n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                        </form>\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("<!--input  type=\"button\" value=\"NEXT\" name=\"next\" onclick=\"location.href=urlForward\"-->\n");
      out.write("                        \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"footer\">\n");
      out.write("                    <input  type=\"button\"  value=\"Admin_Mode\" name=\"Admin_Mode\" onclick=\"location.href='../../indexadmin.jsp'\"/>\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
