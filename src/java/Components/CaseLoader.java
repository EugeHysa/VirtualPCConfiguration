package Components;
import java.util.ArrayList;

public class CaseLoader {
    private ArrayList<Integer> cods = new ArrayList<>();
    private ArrayList<String> brands = new ArrayList<>();
    private ArrayList<String> models = new ArrayList<>();
    private ArrayList<String> types = new ArrayList<>();
    private ArrayList<String> colors = new ArrayList<>();
    private ArrayList<String> mb_comp = new ArrayList<>();
    private ArrayList<Double> max_hd_len = new ArrayList<>();
    private ArrayList<Double> prices = new ArrayList<>();
    private int noe;
     
    public void fillLoader(int cod, String brand, String model, String type, String color, String motherboard_compatibili, Double max_hdrive_lenght, Double price)
    {
        cods.add(cod);
        brands.add(brand);
        models.add(model);
        types.add(type);
        colors.add(color);
        mb_comp.add(motherboard_compatibili);
        max_hd_len.add(max_hdrive_lenght);
        prices.add(price);
        noe++;
    }
    
    public void cleanAll()
    {
        cods.clear();
        brands.clear();
        models.clear();
        types.clear();
        colors.clear();
        mb_comp.clear();
        max_hd_len.clear();
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
    
    public ArrayList<String> listColors()
    {
        return colors;
    }
    
    public ArrayList<String> listMB_Comp()
    {
        return mb_comp;
    }
    
    public ArrayList<Double> listMax_hd_Len()
    {
        return max_hd_len;
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
            System.out.println(cods.get(i) + " " +brands.get(i) + " " +models.get(i) +" " + types.get(i) + " " + colors.get(i) + " " + mb_comp.get(i) + " " + max_hd_len.get(i) + " "+prices.get(i)); 
        }
    }
}