<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cookie</title>
    </head>

    <body>
        Setta un nuovo cookie:
        <form method="POST" action="test.jsp">
            <table>
                <tr>
                    <td colspan="2">Chiave</td>
                    <td><input type="text" name="txtName"/></td>
                </tr>
                <tr>
                    <td colspan="2">Valore</td>
                    <td><input type="text" name="txtValue"/></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit"
                               value="Aggiungi" name="btnAdd"/>
                    </td>
                    <td>
                        <input type="submit"
                               value="Pulisci" name="btnClear"/>
                    </td>
                    <td>
                        <input type="submit"
                               value="Visualizza" name="btnView"/>
                    </td>
                </tr>
            </table>
        </form>

        <br/><br/>

        <%

            javax.servlet.http.Cookie[] cookies;
            java.lang.String name;
            java.lang.String value;
            cookies = request.getCookies();

            if(request.getParameter("btnClear") != null &&
                    cookies != null)
            {
                for(javax.servlet.http.Cookie cookie : cookies)
                {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }

            if(request.getParameter("btnAdd") != null)
            {
                // Aggiungo l'eventuale nuovo cookie
                name = request.getParameter("txtName");
                value = request.getParameter("txtValue");

                if(name != null && value != null &&
                   !name.equals("") && !value.equals(""))
                {
                    javax.servlet.http.Cookie newCookie;

                    newCookie = new Cookie(name, value);
                    response.addCookie(newCookie);

                    out.print("<br/><br/>Cookie Aggiunto: <br/>");
                    out.print(name + " = " + value);
                }
            }

            if(request.getParameter("btnView") != null)
            {
                // STAMPO I COOKIE ATTUALI
                out.print("<div style='text-align: center'>");
                out.print("<h3>");
                out.print("Lista dei Cookie");
                out.print("</h3>");
                out.print("</div>");
                if(cookies != null)
                {
                    for(javax.servlet.http.Cookie cookie : cookies)
                    {
                        name = cookie.getName();
                        value = cookie.getValue();
                        out.print(name + " = " + value);
                        out.print("<br/>");
                    }
                }
            }
        %>
    </body>
</html>