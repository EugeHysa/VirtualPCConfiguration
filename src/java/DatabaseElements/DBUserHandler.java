package DatabaseElements;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
    
    public Boolean getStatusComp(){
        Boolean status = true;
        
        try{
            res = mystmt.executeQuery("select FLAG from ADMINCONTROL");
            while(res.next())
            {
                if(res.getInt(1)==1) status = true;
                if(res.getInt(1)==0) status = false;   
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        return status;
    }
    
    public void setStatusComp(Boolean status)
    {
        try
        {
            if(status == false)
            {
                mystmt.executeUpdate("update ADMINCONTROL set FLAG = 0");
            }
            if(status == true)
            {
                mystmt.executeUpdate("update ADMINCONTROL set FLAG = 1");
            }
        }
        catch(SQLException e)
        {
            
        }
        
    }
    
    public static void main(String[] args)
    {
        DBUserHandler db;
        
        try{
            
            db = new DBUserHandler();
            //db.addUser("giovanna", "yoo", "edfcdfv@csdc.it", "eeeeeeeee");
            
            System.out.println(db.getStatusComp());
            //db.setStatusComp(false);
            //System.out.println(db.checkUser("sdighidibughidi"));
            //System.out.println(db.checkUser("Giovanna"));
            
        }
        catch(SQLException e)
        {
            System.err.println("Errsql");
            
        }
        
        
    }
    
}
