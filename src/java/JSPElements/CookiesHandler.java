/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JSPElements;

import javax.jms.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 */
public class CookiesHandler {
    
    

    
    public String getCookie(String name, HttpServletRequest request)
    {
        Cookie[] cookies = request.getCookies();
        String value = "";
        for(Cookie singleCookie : cookies)
        {
            if(singleCookie.getName().equals(name))
            {
                value = singleCookie.getValue();
            }
        }
        return value;
    }
    
    public Boolean isValidCookie(String name, HttpServletRequest request)
    {
        Boolean state = false;
        Cookie[] cookies = request.getCookies();
        
        for(Cookie singleCookie : cookies)
        {
            if(singleCookie.getName().equals(name))
            {
                state = true;
            }
        }
        return state;
    }
    
}
