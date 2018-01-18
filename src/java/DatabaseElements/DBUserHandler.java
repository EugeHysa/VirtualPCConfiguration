/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseElements;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Utente
 */
public class DBUserHandler extends DBConnection {
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet res = null;
    
    
    
    public DBUserHandler() throws SQLException
    {
        stmt = this.Connect();
    }
    
    public Boolean addUser(String uname, String pwd, String email, String addr) throws SQLException
    {
        Boolean st = false;
        if(checkUser(uname) == false)
        {
            stmt.executeUpdate("insert into customerlogin (USERNAME, PASS, EMAIL, ADDRESS) values ('" + uname + "','" + pwd + "','" + email + "','" + addr +"')");
            System.out.println("Utente " + uname + " creato");
            st = true;
        }
        else
        {
            System.err.println("Utente " + uname + " già esistente");
        }
        
        return st;
    }
    
    
    public Boolean checkUser(String name)
    {
        Boolean st = false;
        try{
            res = stmt.executeQuery("select USERNAME from CustomerLogin");
            while(res.next())
            {
                if(name.equals(res.getString(1)))
                {
                    st = true;
                }
            }
        
            
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
        }
        return st;
    }
    
    
    public static void main(String[] args)
    {
        DBUserHandler db;
        
        try{
            
            db = new DBUserHandler();
            db.addUser("giovanna", "yoo", "edfcdfv@csdc.it", "eeeeeeeee");
            
            
            //System.out.println(db.checkUser("sdighidibughidi"));
            //System.out.println(db.checkUser("Giovanna"));
            
        }
        catch(SQLException e)
        {
            System.err.println("Errsql");
            
        }
        
        
    }
    
}
