package JSPElements;
import DatabaseElements.DBConnection;
import java.sql.*;
public class ComponentParser extends DBConnection {
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet res = null;
    
    public ComponentParser() throws SQLException
    {
        stmt = this.Connect();
    }
    public String getComponent(String table, String cod) throws SQLException
    {
        String output = null;
        
        res = stmt.executeQuery("select * from " + table + " where cod = " + cod);
            while(res.next())
            {
                output = res.getString(2) + "-CC-" + res.getString(3);
            }
            this.closeall();   
        return output;
    }
}