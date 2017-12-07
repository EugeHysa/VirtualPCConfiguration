package Components;
import java.util.ArrayList;

public class GCardLoader {
    private ArrayList<Integer> cods = new ArrayList<>();
    private ArrayList<String> brands = new ArrayList<>();
    private ArrayList<String> models = new ArrayList<>();
    private ArrayList<String> series = new ArrayList<>();
    private ArrayList<String> chipsets = new ArrayList<>();
    private ArrayList<Integer> memory = new ArrayList<>();
    private ArrayList<Double> clocks = new ArrayList<>();
    private ArrayList<Integer> tdps = new ArrayList<>();
    private ArrayList<Integer> length = new ArrayList<>();
    private ArrayList<Double> prices = new ArrayList<>();
    private int noe;
    
    
    public void fillLoader(int cod, String brand, String model, String serie, String chipset, int mem, Double clock, int tdp, int len, Double price)
    {
        cods.add(cod);
        brands.add(brand);
        models.add(model);
        series.add(serie);
        chipsets.add(chipset);
        memory.add(mem);
        clocks.add(clock);
        tdps.add(tdp);
        length.add(len);
        prices.add(price);
        noe++;
    }
    
    public void cleanAll()
    {
        cods.clear();
        brands.clear();
        models.clear();
        series.clear();
        chipsets.clear();
        memory.clear();
        clocks.clear();
        tdps.clear();
        length.clear();
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
    
    public ArrayList<String> listSeries()
    {
        return series;
    }
    
    public ArrayList<String> listChipsets()
    {
        return chipsets;
    }
    
    public ArrayList<Integer> listMemory()
    {
        return memory;
    }
    public ArrayList<Double> listClocks()
    {
        return clocks;
    }
    public ArrayList<Integer> listTDPs()
    {
        return tdps;
    }
    public ArrayList<Integer> listLength()
    {
        return length;
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
            System.out.println(cods.get(i)+ " " + brands.get(i) + " " +models.get(i) +" " + series.get(i) + " " + chipsets.get(i) + " " + memory.get(i) + " " + clocks.get(i) + " " + tdps.get(i) + " " + length.get(i) +  " " + prices.get(i));   
        }
    }
}