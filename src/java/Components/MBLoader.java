package Components;
import java.sql.SQLException;
import java.util.ArrayList;

public class MBLoader {
    private ArrayList<Integer> cods = new ArrayList<>();
    private ArrayList<String> brands = new ArrayList<>();
    private ArrayList<String> models = new ArrayList<>();
    private ArrayList<String> sockets = new ArrayList<>();
    private ArrayList<String> formfactors = new ArrayList<>();
    private ArrayList<String> chipsets = new ArrayList<>();
    private ArrayList<Integer> ramslots = new ArrayList<>();
    private ArrayList<String> ramtypes = new ArrayList<>();
    private ArrayList<Integer> maxrams = new ArrayList<>();
    private ArrayList<Integer> tdps = new ArrayList<>();
    private ArrayList<Double> prices = new ArrayList<>();
    private int noe;
    
    public void fillLoader(int cod, String brand, String model, String socket, String formfactor , String chipset, int ramslot, String ramtype, int maxram, int tdp, Double price)
    {
        cods.add(cod);
        brands.add(brand);
        models.add(model);
        sockets.add(socket);
        formfactors.add(formfactor);
        chipsets.add(chipset);
        ramslots.add(ramslot);
        ramtypes.add(ramtype);
        maxrams.add(maxram);
        tdps.add(tdp);       
        prices.add(price);
        noe++;
    }
    
    public void cleanAll()
    {
        cods.clear();
        brands.clear();
        models.clear();
        sockets.clear();
        formfactors.clear();
        chipsets.clear();
        ramslots.clear();
        maxrams.clear();
        tdps.clear();
        prices.clear();
        noe = 0;
    }
    
    public ArrayList<Integer> listCods()
    {
        return cods;
    }
   
    public ArrayList<String> listBrands()
    {
        return brands;
    }
    
    public ArrayList<String> listModels()
    {
        return models;
    }
    
    public ArrayList<String> listChipsets()
    {
        return chipsets;
    }
    
    public ArrayList<String> listSockets()
    {
        return sockets;
    }
    
    public ArrayList<String> listFormfactors()
    {
        return formfactors;
    }
    
    public ArrayList<Integer> listramslots()
    {
        return ramslots;
    }
    
    public ArrayList<Integer> listmaxrams()
    {
        return maxrams;
    }
    
        public ArrayList<String> listRamTypes()
    {
        return ramtypes;
    }
    
    public ArrayList<Integer> listTDPs()
    {
        return tdps;
    }
    
    
    public ArrayList<Double> listPrices()
    {
        return prices;
    }
    
    public int getMBSize()
    {
        return noe;
    }
    
    public void printAll()
    {
        System.out.println(noe);
        for(int i = 0; i < noe; i++)
        {
            
            System.out.println(cods.get(i)+ " "+brands.get(i) + " " +models.get(i) + " " + sockets.get(i) + " " + formfactors.get(i) + " " +chipsets.get(i) + " "  + ramslots.get(i) + " " + ramtypes.get(i) + " " + maxrams.get(i) + " "+ tdps.get(i)+" "+prices.get(i));
            
        }
    }

}