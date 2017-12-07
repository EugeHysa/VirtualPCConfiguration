package Components;

import DatabaseElements.DBFilters;
import java.sql.SQLException;
import java.util.ArrayList;

public class HTMLTableCreator {
    private ArrayList<Integer> fcod = new ArrayList<>();
    
    public static String MBTableCreator(Boolean f)
    {
        String output;
        StringBuilder ss = new StringBuilder();
        try{
            DBFilters db = new DBFilters();
            MBLoader mb = new MBLoader();
        
            db.loadMB(mb);
            
            ss.append("<table id=\"table1\" border=\"0\">");
            ss.append("<thead>");
            ss.append("<tr>");
            ss.append("<th>Brand</th>");
            ss.append("<th>Model</th>");
            ss.append("<th>Socket_CPU</th>");
            ss.append("<th>Formfactor</th>");
            ss.append("<th>Chipset</th>");
            ss.append("<th>RAM_Slots</th>");
            ss.append("<th>RAM_type</th>");
            ss.append("<th>RAM_max_GB</th>");
            ss.append("<th>TDP</th>");
            ss.append("<th>Price</th>");
            if(f == true) ss.append("<th>Delete</th>");
            ss.append("</tr>");
            ss.append("</thead>");
            ss.append("<tbody>");
        
        for(int i = 0; i < mb.getMBSize(); i++)
        {
            
            String str1 = mb.listBrands().get(i);
            String str2 = mb.listModels().get(i);
            String str3 = mb.listSockets().get(i);
            String str4 = mb.listFormfactors().get(i);
            String str5 = mb.listChipsets().get(i);
            Integer int1 = mb.listramslots().get(i);
            String str6 = mb.listRamTypes().get(i);
            Integer int2 = mb.listmaxrams().get(i);
            Integer int3 = mb.listTDPs().get(i);
            Double dub1 = mb.listPrices().get(i);
            
            ss.append("<tr>");
            ss.append("<td>"+str1+"</td>");
            ss.append("<td>"+str2+"</td>");
            ss.append("<td>"+str3+"</td>");
            ss.append("<td>"+str4+"</td>");
            ss.append("<td>"+str5+"</td>");
            ss.append("<td>"+int1+"</td>");
            ss.append("<td>"+str6+"</td>");
            ss.append("<td>"+int2+"</td>");
            ss.append("<td>"+int3+"</td>");
            ss.append("<td>"+dub1+"</td>");
            if(f == true) ss.append("<td> <form action=\"../DeletePage/DeleteMotherboard.jsp\" method=\"post\"><input type=\"hidden\" value=\" " + str1 + " \" name = \"brand_delete\"> <input type=\"hidden\" value=\" " + str2 + " \" name = \"model_delete\"> <input type=\"submit\" value=\"Remove\"> </form action> </td>");
            ss.append("</tr>");
        }		
        
        ss.append("</tbody>");
        ss.append("</table>");
        db.closeall();
    }
    catch(SQLException ex){
        ss.append("Eccezione SQL.");
    }
        output = ss.toString();
        return output;
    }

    public static String CPUTableCreator(Boolean f, String brand, String model)
    {
        String output;
        StringBuilder ss = new StringBuilder();
        
        try{                                                            
        DBFilters db = new DBFilters();
        CPULoader cpu = new CPULoader();
        
        
        
	if(f == true) db.loadCPU(cpu);
	if(f == false)
        {
            cpu = db.iSelected2(brand,model);
        }

        
        ss.append("<table id=\"table2\" border=\"1\">");
        ss.append("<tr>");
        ss.append("<th>Brand</th>");
        ss.append("<th>Model</th>");
        ss.append("<th>Socket</th>");
        ss.append("<th>FREQUENZA_GHZ</th>");
        ss.append("<th>CORES</th>");
        ss.append("<th>TDP</th>");
        ss.append("<th>PRICE</th>");
        if(f==true) ss.append("<th>Delete</th>");
        ss.append("</tr>");
        
                                
        for(int i = 0; i < cpu.getSize(); i++)
        {
            String str1 = cpu.listBrands().get(i);
            String str2 = cpu.listModels().get(i);
            String str3 = cpu.listSockets().get(i);
            Double db1 = cpu.listFrequencies().get(i);
            Integer int1 = cpu.listCores().get(i);
            Integer int2 = cpu.listTDPs().get(i);
            Double db2 = cpu.listPrices().get(i);
            
            ss.append("<tr>");
            ss.append("<td>"+str1+"</td>");
            ss.append("<td>"+str2+"</td>");
            ss.append("<td>"+str3+"</td>");
            ss.append("<td>"+db1+"</td>");
            ss.append("<td>"+int1+"</td>");
            ss.append("<td>"+int2+"</td>");
            ss.append("<td>"+db2+"</td>");
            if(f == true) ss.append("<td> <form action=\"../DeletePage/DeleteCpu.jsp\" method=\"post\"><input type=\"hidden\" value=\" " + str1 + " \" name = \"brand_delete\"> <input type=\"hidden\" value=\" " + str2 + " \" name = \"model_delete\"> <input type=\"submit\" value=\"Remove\"> </form action> </td>");
            ss.append("</tr>");
             }	
            ss.append("</table>");
            
            db.closeall();
        }
        catch(SQLException ex){
            ss.append("Eccezione SQL.");
        }	

        output = ss.toString();
                                   
        return output;
    }
    
    public static String RAMTableCreator(Boolean f, String brand, String model)
    {
        String output;
        StringBuilder ss = new StringBuilder();
        
        try{                                                            
        DBFilters db = new DBFilters();
        RAMLoader ram = new RAMLoader();
        
        
        
	if(f == true) db.loadRAM(ram);
	if(f == false)
        {
            ram = db.isSelected3(brand,model);
        }

        
        ss.append("<table id=\"table3\" border=\"1\">");
        ss.append("<tr>");
        ss.append("<th>Brand</th>");
        ss.append("<th>Model</th>");
        ss.append("<th>RAM_Type</th>");
	ss.append("<th>Speed</th>");
	ss.append("<th>tdp</th>");	
	ss.append("<th>Number_Of_Modules</th>");
        ss.append("<th>Size_Of_Modules</th>");
    	ss.append("<th>Size</th>");
        ss.append("<th>Price</th>");
        if(f==true) ss.append("<th>Delete</th>");
        ss.append("</tr>");
        
                                
        for(int i = 0; i < ram.getSize(); i++)
        {
            String str1 = ram.listBrands().get(i);
            String str2 = ram.listModels().get(i);
            String str3 = ram.listTypes().get(i);
            String str4 = ram.listSpeeds().get(i);
            Integer int1 = ram.listTDPs().get(i);
            Integer int2 = ram.listNOMs().get(i);
            Integer int3 = ram.listSOMs().get(i);
            Integer int4 = ram.listSizes().get(i);
            Double db1 = ram.listPrices().get(i);
            
            ss.append("<tr>");
            ss.append("<td>"+str1+"</td>");
            ss.append("<td>"+str2+"</td>");
            ss.append("<td>"+str3+"</td>");
            ss.append("<td>"+str4+"</td>");
            ss.append("<td>"+int1+"</td>");
            ss.append("<td>"+int2+"</td>");
            ss.append("<td>"+int3+"</td>");
            ss.append("<td>"+int4+"</td>");
            ss.append("<td>"+db1+"</td>");
            if(f==true) ss.append("<td> <form action=\"../DeletePage/DeleteRam.jsp\" method=\"post\"> <input type=\"hidden\" value=\" " + str1 + " \" name = \"brand_delete\"> <input type=\"hidden\" value=\" " + str2 + " \" name = \"model_delete\"> <input type=\"submit\" value=\"Remove\"> </form action> </td>");
            ss.append("</tr>");
            
        }
        ss.append("</table>");
        db.closeall();
        }
        catch(SQLException ex){
            ss.append("Eccezione SQL.");
        }	

        output = ss.toString();
                                   
        return output;
    }
    
    
    public static String createGCard(Boolean f)
    {
        String output;
        StringBuilder ss = new StringBuilder();
        
        try{
        DBFilters db = new DBFilters();
        GCardLoader gc = new GCardLoader();
        
        db.loadGCard(gc);
        
        ss.append("<table id=\"table4\" border=\"1\">");
        ss.append("<tr>");
        ss.append("<th>Brand</th>");
	ss.append("<th>Model</th>");
	ss.append("<th>Series</th>");
	ss.append("<th>Chipset</th>");
	ss.append("<th>Memory</th>");
	ss.append("<th>Core_Clock</th>");
	ss.append("<th>TDP</th>");	
	ss.append("<th>Length</th>");
	ss.append("<th>Price</th>");
	if(f==true) ss.append("<th>Delete</th>");
        ss.append("</tr>");
        

        for(int i = 0; i < gc.getSize(); i++)
        {
            String str1 = gc.listBrands().get(i);
            String str2 = gc.listModels().get(i);
            String str3 = gc.listSeries().get(i);
            String str4 = gc.listChipsets().get(i);
            Integer int1 = gc.listMemory().get(i);
            Double db1 = gc.listClocks().get(i);
            Integer int2 = gc.listTDPs().get(i);
            Integer int3 = gc.listLength().get(i);
            Double db2 = gc.listPrices().get(i);
            ss.append("<tr>");
            ss.append("<td>"+str1+"</td>");
            ss.append("<td>"+str2+"</td>");
            ss.append("<td>"+str3+"</td>");
            ss.append("<td>"+str4+"</td>");
            ss.append("<td>"+int1+"</td>");
            ss.append("<td>"+db1+"</td>");
            ss.append("<td>"+int2+"</td>");
            ss.append("<td>"+int3+"</td>");
            ss.append("<td>"+db2+"</td>");
            if(f==true) ss.append("<td> <form action=\"../DeletePage/DeleteGCard.jsp\" method=\"post\"> <input type=\"hidden\" value=\" " + str1 + " \" name = \"brand_delete\"> <input type=\"hidden\" value=\" " + str2 + " \" name = \"model_delete\"> <input type=\"submit\" value=\"Remove\"> </form action> </td>");
            ss.append("</tr>");
    
        }
        ss.append("</table>");
        db.closeall();
        }
        catch(SQLException ex){
        System.out.println("Eccezione SQL.");
        }
        
        output = ss.toString();
        
        return output;
    }
    
    
    public static String createHDrive(Boolean f)
    {
        String output;
        StringBuilder ss = new StringBuilder();
        
        try{
        DBFilters db = new DBFilters();
        HDriveLoader hd = new HDriveLoader();
        
        db.loadHDrive(hd);
        
        ss.append("<table id=\"table5\" border=\"1\">");
        ss.append("<tr>");
        ss.append("<th>Brand</th>");
        ss.append("<th>Model</th>");
        ss.append("<th>Series</th>");
        ss.append("<th>Form</th>");
        ss.append("<th>Type</th>");
        ss.append("<th>Size</th>");
        ss.append("<th>TDP</th>");
        ss.append("<th>Cache</th>");
        ss.append("<th>Price</th>");
	if(f==true) ss.append("<th>Delete</th>");
        ss.append("</tr>");
        
        for(int i = 0; i < hd.getSize(); i++)
        {
            String str1 = hd.listBrands().get(i);
	    String str2 = hd.listModels().get(i);
	    String str3 = hd.listSeries().get(i);
	    String str4 = hd.listForms().get(i);
	    String str5 = hd.listTypes().get(i);				
	    Integer int1 = hd.listSizes().get(i);
            Integer int2 = hd.listTDPs().get(i);
            Integer int3 = hd.listCaches().get(i); 
	    Double db1 = hd.listPrices().get(i);
	    ss.append("<tr>");
	    ss.append("<td>"+str1+"</td>");
            ss.append("<td>"+str2+"</td>");
            ss.append("<td>"+str3+"</td>");
            ss.append("<td>"+str4+"</td>");
            ss.append("<td>"+str5+"</td>");
            ss.append("<td>"+int1+"</td>");
            ss.append("<td>"+int2+"</td>");
            ss.append("<td>"+int3+"</td>");
            ss.append("<td>"+db1+"</td>");
            if(f == true) ss.append("<td> <form action=\"../DeletePage/DeleteHDisk.jsp\" method=\"post\"> <input type=\"hidden\" value=\" " + str1 + " \" name = \"brand_delete\"> <input type=\"hidden\" value=\" " + str2 + " \" name = \"model_delete\"> <input type=\"submit\" value=\"Remove\"> </form action> </td>");
            ss.append("</tr>");
        }		
        
        ss.append("</table>");
        db.closeall();
        }
        catch(SQLException ex){
        System.out.println("Eccezione SQL.");
        }
        
        output = ss.toString();
        
        return output;
    }
    
    public static String createPS(Boolean f)
    {
        String output;
        StringBuilder ss = new StringBuilder();
        
        try{
        DBFilters db = new DBFilters();
        PSLoader ps = new PSLoader();
        
        db.loadPS(ps);
        
        ss.append("<table id=\"table6\" border=\"1\">");
        ss.append("<tr>");
        ss.append("<th>Brand</th>");
        ss.append("<th>Model</th>");
        ss.append("<th>Series</th>");
        ss.append("<th>Form</th>");
        ss.append("<th>Efficiency</th>");
        ss.append("<th>TDP</th>");
        ss.append("<th>Modular</th>");
        ss.append("<th>Price</th>");
	if(f==true) ss.append("<th>Delete</th>");
        ss.append("</tr>");
        
        for(int i = 0; i < ps.getSize(); i++)
        {
            String str1 = ps.listBrands().get(i);
            String str2 = ps.listModels().get(i);
            String str3 = ps.listSeries().get(i);
            String str4 = ps.listForms().get(i);
            String str5 = ps.listEfficiencies().get(i);
            Integer int1 = ps.listMaxTDPs().get(i);
            String str6 = ps.listModulars().get(i);
            Double db1 = ps.listPrices().get(i);
            
            ss.append("<tr>");
            ss.append("<td>"+str1+"</td>");
            ss.append("<td>"+str2+"</td>");
            ss.append("<td>"+str3+"</td>");
            ss.append("<td>"+str4+"</td>");
            ss.append("<td>"+str5+"</td>");
            ss.append("<td>"+int1+"</td>");
            ss.append("<td>"+str6+"</td>");
            ss.append("<td>"+db1+"</td>");
            if(f == true) ss.append("<td> <form action=\"../DeletePage/DeletePS.jsp\" method=\"post\"> <input type=\"hidden\" value=\" " + str1 + " \" name = \"brand_delete\"> <input type=\"hidden\" value=\" " + str2 + " \" name = \"model_delete\"> <input type=\"submit\" value=\"Remove\"> </form action> </td>");
            ss.append("</tr>");
        }		
        
        ss.append("</table>");
        db.closeall();
        }
        catch(SQLException ex){
        System.out.println("Eccezione SQL.");
        }
        
        output = ss.toString();
        
        return output;
    }
    
    
    public static String createCase(Boolean f)
    {
        String output;
        StringBuilder ss = new StringBuilder();
        
        try{
        DBFilters db = new DBFilters();
        CaseLoader ca = new CaseLoader();
        
        db.loadCase(ca);
        
        ss.append("<table id=\"table7\" border=\"1\">");
        ss.append("<tr>");
        ss.append("<th>Brand</th>");
        ss.append("<th>Model</th>");
        ss.append("<th>Type</th>");
        ss.append("<th>Color</th>");
        ss.append("<th>MotherBoard_Compaibili</th>");
        ss.append("<th>Max_Length</th>");
        ss.append("<th>Price</th>");
	if(f==true) ss.append("<th>Delete</th>");
        ss.append("</tr>");
        
        for(int i = 0; i < ca.getSize(); i++)
        {
            String str1 = ca.listBrands().get(i);
            String str2 = ca.listModels().get(i);
            String str3 = ca.listTypes().get(i);
            String str4 = ca.listColors().get(i);
            String str5 = ca.listMB_Comp().get(i);
            Double db1 = ca.listMax_hd_Len().get(i);
            Double db2 = ca.listPrices().get(i);
            
            ss.append("<tr>");
            ss.append("<td>"+str1+"</td>");
            ss.append("<td>"+str2+"</td>");
            ss.append("<td>"+str3+"</td>");
            ss.append("<td>"+str4+"</td>");
            ss.append("<td>"+str5+"</td>");
            ss.append("<td>"+db1+"</td>");
            ss.append("<td>"+db2+"</td>");
            if(f == true) ss.append("<td> <form action=\"../DeletePage/DeleteCase.jsp\" method=\"post\"> <input type=\"hidden\" value=\" " + str1 + " \" name = \"brand_delete\"> <input type=\"hidden\" value=\" " + str2 + " \" name = \"model_delete\"> <input type=\"submit\" value=\"Remove\"> </form action> </td>");
            ss.append("</tr>");
        }		
        
        ss.append("</table>");
        db.closeall();
        }
        catch(SQLException ex){
        System.out.println("Eccezione SQL.");
        }
        
        output = ss.toString();
        
        return output;
    }

}
