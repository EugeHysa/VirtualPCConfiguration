package Components;
import java.util.ArrayList;

public class RAMLoader {
    
    private ArrayList<Integer> cods = new ArrayList<>();
    private ArrayList<String> brands = new ArrayList<>();
    private ArrayList<String> models = new ArrayList<>();
    private ArrayList<String> types = new ArrayList<>();
    private ArrayList<String> speeds = new ArrayList<>();
    private ArrayList<Integer> tdps = new ArrayList<>();
    private ArrayList<Integer> noms = new ArrayList<>();
    private ArrayList<Integer> soms = new ArrayList<>();
    private ArrayList<Integer> sizes = new ArrayList<>();
    private ArrayList<Double> prices = new ArrayList<>();
    private int noe;
    
    
    public void fillLoader(int cod, String brand, String model, String type, String speed, int tdp, int nom, int som, int size, Double price)
    {
        cods.add(cod);
        brands.add(brand);
        models.add(model);
        types.add(type);
        speeds.add(speed);
        tdps.add(tdp);
        noms.add(nom);
        soms.add(som);
        sizes.add(size);
        prices.add(price);
        noe++;
    }
    
    public void cleanAll()
    {
        cods.clear();
        brands.clear();
        models.clear();
        types.clear();
        speeds.clear();
        tdps.clear();
        noms.clear();
        soms.clear();
        sizes.clear();
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
    
    public ArrayList<String> listTypes()
    {
        return types;
    }
    
    public ArrayList<String> listSpeeds()
    {
        return speeds;
    }
    
    public ArrayList<Integer> listTDPs()
    {
        return tdps;
    }
    
    public ArrayList<Integer> listNOMs()
    {
        return noms;
    }
    
    public ArrayList<Integer> listSOMs()
    {
        return soms;
    }
    
    public ArrayList<Integer> listSizes()
    {
        return sizes;
    }
    
    public ArrayList<Double> listPrices()
    {
        return prices;
    }
     public int getSize()
    {
        return noe;
    }
    
    public void printAll()
    {
        System.out.println(noe);
        for(int i = 0; i < noe; i++)
        {
            System.out.println(cods.get(i) + " " + brands.get(i) + " " +models.get(i) +" " + types.get(i) + " " + speeds.get(i) + " " + tdps.get(i) + " " + noms.get(i) + " " + soms.get(i) + " " + sizes.get(i) + " " + prices.get(i)); 
        }
    }
}