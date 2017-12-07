package DatabaseElements;

import Components.CPULoader;
import Components.DBConnection;
import Components.MBLoader;
import Components.RAMLoader;
import java.sql.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author cl427263
 */
public class DBFilters extends DBConnection {
    
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet res = null;
    
    
    public DBFilters() throws SQLException
    {
        
        stmt = this.Connect();
        
        
    }
    
    public MBLoader iSelected() throws SQLException
    {
        MBLoader mb = new MBLoader();
        res = stmt.executeQuery("select * from MOTHERBOARD");
            while(res.next())
            {
                
                mb.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getInt(7), res.getString(8).trim(), res.getInt(9), res.getInt(10), res.getDouble(11));
                
            }
        
        
        return mb;
    }
    
    
    public CPULoader iSelected2(String selectedBrand, String selectedModel) throws SQLException
    {
        CPULoader cpu = new CPULoader();
        res = stmt.executeQuery("select CPU.* from MOTHERBOARD,CPU where SOCKET_CPU=CPUSOCKET and MOTHERBOARD.BRAND = '"+ selectedBrand + "' and MOTHERBOARD.MODEL = '" + selectedModel + "'");
        
        
        while(res.next())
            {
                cpu.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getDouble(5), res.getInt(6), res.getInt(7),  res.getDouble(8));
            }
        
        return cpu;
    }
    
    public CPULoader cpuFiltered(String cod) throws SQLException
    {
        CPULoader cpu = new CPULoader();
        res = stmt.executeQuery("select CPU.* from MOTHERBOARD,CPU where SOCKET_CPU=CPUSOCKET and MOTHERBOARD.COD = '"+ Integer.parseInt(cod) + "'");
        
        
        while(res.next())
            {
                cpu.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getDouble(5), res.getInt(6), res.getInt(7),  res.getDouble(8));
            }
        
        return cpu;
    }
    
    
    public RAMLoader isSelected3(String selectedBrand, String selectedModel) throws SQLException
    {
        RAMLoader r = new RAMLoader();
        
        res = stmt.executeQuery("select R1.*\n" +
"from MOTHERBOARD M1, RAM R1\n" +
"where M1.RAM_TYPE=R1.SPEED and M1.BRAND = '"+selectedBrand+"' and M1.MODEL = '"+selectedModel+"'\n");
        
        
        while(res.next())
            {
                r.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getInt(6), res.getInt(7), res.getInt(8), res.getInt(9), res.getDouble(10));
            }
        
        return r;
    }
    
    
    
    public static void main(String[] args) {
        DBFilters s = null;
        
        try{
            s = new DBFilters();
            s.Connect();
        MBLoader mb = s.iSelected();
        System.out.println("+++"+mb.listBrands());
        CPULoader cpu = s.iSelected2("Asus", "Z170-A");
        
        System.out.println(cpu.listBrands());
        }
        catch(SQLException sr)
        {
            
        }
    }
    
}
