/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VirtualPCConfigurator;



import java.sql.*;




/**
 *
 * @author user
 */
public class DBConnection 
{     
    String user = "AdminKing";
    String pass = "SuperAMG2017#";
        
    Connection conn;
    Statement mystmt;
    ResultSet res;
    
    public DBConnection()
    {
        conn = null;
        mystmt = null;
        res = null;
    }
    
    
    public String getUser()
    {
        return user;
    }
    
    public String getPass()
    {
        return pass;
    }
    
    public void Connect() throws SQLException
    {
        
        
        try{
            Class.forName("com.mysql.jdbc.Driver");  
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Components?autoReconnect=true&useSSL=false", user, pass);
            mystmt = conn.createStatement();
            
            }
        catch(Exception ex)
        {
            System.err.println("Errore. Database non trovato");
        }
        
            
    }
    
    
    public void option1() throws SQLException
    {
        res = mystmt.executeQuery("select * from cpu");
        while(res.next())
        {
            System.out.println(res.getString("brand")+" "+res.getString("model"));
        }
    }
    
    
    
    public void closeall() throws SQLException
    {
        
            if(conn!=null)
            {
            conn.close();
            }
            if(mystmt !=null)
            {
            mystmt.close();
            }
            if(res!=null)
            {
            res.close();
            }
            
        
    }
    

    public static void main(String[]args)
    {
        DBConnection test = new DBConnection();
        try{
        test.Connect();
        test.option1();
        test.closeall();
        }
        catch(SQLException e)
        {
            
        }
    }
    
    
}
