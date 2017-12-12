/*


 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Components;



import java.sql.*;




/**
 *
 * @author user
 */
public class DBConnection 
{     
    private String user;
    private String pass;
        
    Connection conn;
    Statement mystmt;
    ResultSet res;
    
    
    
    public DBConnection()
    {
        conn = null;
        mystmt = null;
        res = null;
    }
    
    
    
    public Statement Connect() throws SQLException
    {
        
        
        try{
            //commentare per bloccare sqlite
            //Class.forName("org.sqlite.JDBC");
            //conn = DriverManager.getConnection("jdbc:sqlite:sqlite.db");
            //togliere commenti per MYSQL
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Components?autoReconnect=true&useSSL=false", "root", "untothedead94");
            mystmt = conn.createStatement();
            
            }
        catch(ClassNotFoundException ex)
        {
            System.err.println("Errore. Driver MySQL non trovato");
        }
        
            return mystmt;
    }
    

    //pass the username and password from LoginForm
    public Boolean setUP(String user, String pass)
    {
        if(!user.equals("") && !pass.equals(""))
        {
            this.user = user;
            
            this.pass = pass;
            
            return true;
        }
        else
            return false;
    }
    
    //close all connection from MySQL database
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
            System.out.println("MySQL connection closed");
    }
    
    public void loadCPU(CPULoader cpu)
    {
        try
        {
            res = mystmt.executeQuery("select * from CPU");
            while(res.next())
            {
                cpu.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getDouble(5), res.getInt(6), res.getInt(7),  res.getDouble(8));
            }

        }
        catch(SQLException ex)
        {
            
        }
        
    }

    public void filldbCPU(String brand, String model, String socket, Double frequency, int core, int tdp, Double price)
    {
        try
        {
            int ress;
            ress = mystmt.executeUpdate("insert into CPU (BRAND, MODEL, CPUSOCKET, FREQUENCY, CORES, TDP, PRICE) values('"+brand+"', '"+model+"', '"+socket+"', "+frequency+", "+core+", "+tdp+", "+price+")");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            System.out.println("Wrong query");
        }
            
        
    }

    
    public void removeShCPU(String brand, String model)
    {
        try
        {
            int ress;            
            ress = mystmt.executeUpdate("delete from CPU where brand = '"+brand+"' and model = '"+model+"'");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
    }
    
    

     public void loadCase(CaseLoader c)
    {
        try
        {
            res = mystmt.executeQuery("select * from PCCASE");
            while(res.next())
            {
                c.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getDouble(7), res.getDouble(8));
            }

        }
        catch(SQLException ex)
        {
            
        }
        
    }

    public void filldbCase(String brand, String model, String type, String color, String MOTHERBOARD_compatibili, Double max_hdrive_length, Double price)
    {
        try
        {
            int ress;
            ress = mystmt.executeUpdate("insert into PCCASE (BRAND, MODEL, CASETYPE, COLOR, COMPATIBLE_MOTHERBOARDS, MAX_HDRIVE_LENGTH, PRICE) values('"+brand+"', '"+model+"', '"+type+"', '"+color+"', '"+MOTHERBOARD_compatibili+"', "+max_hdrive_length+", "+price+")");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
            
        
    }

    public void removeShCase(String brand, String model)
    {
        try
        {
            int ress;            
            ress = mystmt.executeUpdate("delete from PCCASE where brand = '"+brand+"' and model = '"+model+"'");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
    }
    
    
    public void loadMB(MBLoader mb)
    {
        try
        {
            res = mystmt.executeQuery("select * from MOTHERBOARD");
            while(res.next())
            {
                mb.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getInt(7), res.getString(8), res.getInt(9), res.getInt(10), res.getDouble(11));
                
            }
            
            
        }
        catch(SQLException ex)
        {
            
        }
        
    }
    
    public void filldbMB(String brand, String model, String socket, String formfactor , String chipset, int ramslot, String ramtype, int maxram, int tdp, Double price)
    {
        try
        {
            int ress;            
            ress = mystmt.executeUpdate("insert into MOTHERBOARD (BRAND, MODEL, SOCKET_CPU, FORMFACTOR, CHIPSET, RAM_SLOTS, RAM_TYPE, RAM_MAX_GB, TDP, PRICE) values('"+brand+"', '"+model+"','"+socket+"', '"+formfactor+"', '"+chipset+"',  "+ramslot+", '"+ ramtype + "', "+ maxram+", "+tdp+", "+price+")");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }

    }
    
    
    
    
    public void removeShMB(String brand, String model)
    {
        try
        {
            int ress;
            ress = mystmt.executeUpdate("delete from MOTHERBOARD where brand = '"+brand+"' and model = '"+model+"'");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }

    }
    
    public void filldbPS(String brand, String model, String series, String form, String efficiency ,int tdp, String modular, Double price)
    {
        try
        {
            int ress;
            ress = mystmt.executeUpdate("insert into POWER_SUPPLY (BRAND, MODEL, SERIES, FORM, EFFICIENCY, TDP, MODULAR, PRICE) values('"+brand+"', '"+model+"', '"+series+"', '"+form+"', '"+efficiency+"', "+tdp+", '"+modular+"', "+price+")");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
    }
    
        
    public void loadPS(PSLoader ps)
    {
        try
        {
            res = mystmt.executeQuery("select * from POWER_SUPPLY");
            while(res.next())
            {
                ps.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getInt(7), res.getString(8), res.getDouble(9));
            }
 
        }
        catch(SQLException ex)
        {
            
        }
        
    }

    
     public void removeShPS(String brand, String model)
    {
        try
        {
            int ress;            
            ress = mystmt.executeUpdate("delete from POWER_SUPPLY where brand = '"+brand+"' and model = '"+model+"'");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
    }
    
    public void loadRAM(RAMLoader ram)
    {
        try
        {
            res = mystmt.executeQuery("select * from RAM");
            while(res.next())
            {
                ram.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getInt(6), res.getInt(7), res.getInt(8), res.getInt(9), res.getDouble(10));
            }

        }
        catch(SQLException ex)
        {
            
        }
        
    }

    public void filldbRAM(String brand, String model, String type, String speed, int tdp, int nom, int som, int size, Double price)
    {
        try
        {
            int ress;
            ress = mystmt.executeUpdate("insert into RAM (BRAND, MODEL, RAM_TYPE, SPEED, TDP, NUMBER_OF_MODULES, SIZE_OF_MODULES, SIZE, PRICE) values('"+brand+"', '"+model+"', '"+type+"', '"+speed+"', "+tdp+", "+nom+", "+som+ ","+ size +", "+price+")");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
    }

    
     public void removeShRAM(String brand, String model)
    {
        try
        {
            int ress;            
            ress = mystmt.executeUpdate("delete from RAM where brand = '"+brand+"' and model = '"+model+"'");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
    }
    
    public void loadGCard(GCardLoader gc)
    {
        try
        {
            res = mystmt.executeQuery("select * from GRAPHICS_CARD");
            while(res.next())
            {
                gc.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getInt(6), res.getDouble(7), res.getInt(8), res.getInt(9),  res.getDouble(10));
            }

        }
        catch(SQLException ex)
        {
            
        } 
    }
    
    public void filldbGCard(String brand, String model, String serie, String chipset, int mem, Double clock, int tdp, int length, Double price)
    {
        try
        {
            int ress;
            ress = mystmt.executeUpdate("insert into GRAPHICS_CARD (BRAND, MODEL, SERIES, CHIPSET, MEMORY, CORE_CLOCK, TDP, LENGTH, PRICE) values('"+brand+"', '"+model+"', '"+serie+"', '"+chipset+"', "+mem+", "+ clock +", "+tdp+", "+length+", "+price+")");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
    }
    
    
          
        public void removeShGC(String brand, String model){
        try
        {
            int ress;            
            ress = mystmt.executeUpdate("delete from GRAPHICS_CARD where brand = '"+brand+"' and model =  '"+model+"'");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
            
        
    }
    
    public void loadHDrive(HDriveLoader hdd)
    {
        try
        {
            res = mystmt.executeQuery("select * from HDRIVE");
            while(res.next())
            {
                hdd.fillLoader(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getInt(7), res.getInt(8), res.getInt(9), res.getDouble(10));
            }
        }
        catch(SQLException ex)
        {
            
        }
        
    }
    
    public void filldbHDrive(String brand, String model, String serie, String form, String type, int size, int tdp, int cache, Double price)
    {
        try
        {
            int ress;
            ress = mystmt.executeUpdate("insert into HDRIVE values('"+brand+"', '"+model+"', '"+serie+"', '"+form+"', '"+type+"', "+size+","+ tdp + ", " + cache +", "+price+")");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
            
        
    }
    

        public void removeShHD(String brand, String model)
        {
        try
        {
            int ress;            
            ress = mystmt.executeUpdate("delete from HDRIVE where Brand = '"+brand+"' and Model = '"+model+"' " );
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }
      
       
            
        
    }

        
        public void removeShrt(String table, String cod)
    {
        
        
        try
        {
            int ress;
            ress = mystmt.executeUpdate("delete from "+ table +" where COD = '"+Integer.parseInt(cod)+"'");
            System.out.println(ress + " query affected");
        }
        catch(SQLException ex)
        {
            
        }

    }

    public static void main(String[] args) {
        DBConnection db = new DBConnection();
        RAMLoader c = new RAMLoader();
        try{
        db.Connect();
        db.loadRAM(c);
        c.printAll();
        db.removeShrt("MOTHERBOARD", "1015");
        db.closeall();
        
        }
        catch(SQLException e)
        {
            
        }
    }
    

}