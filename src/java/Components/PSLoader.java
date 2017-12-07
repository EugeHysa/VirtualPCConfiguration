package Components;
import java.util.ArrayList;

public class PSLoader {
    
    private ArrayList<Integer> cods = new ArrayList<>();
    private ArrayList<String> brands = new ArrayList<>();
    private ArrayList<String> models = new ArrayList<>();
    private ArrayList<String> serie = new ArrayList<>();
    private ArrayList<String> forms = new ArrayList<>();
    private ArrayList<String> efficiencies = new ArrayList<>();
    private ArrayList<Integer> maxtdps = new ArrayList<>();
    private ArrayList<String> modulars = new ArrayList<>();
    private ArrayList<Double> prices = new ArrayList<>();
    private int noe;
    
    public void fillLoader(int cod, String brand, String model, String series, String form, String efficiency ,int tdp, String modular, Double price)
    {
        cods.add(cod);
        brands.add(brand);
        models.add(model);
        serie.add(series);
        forms.add(form);
        efficiencies.add(efficiency);
        maxtdps.add(tdp);
        modulars.add(modular);
        prices.add(price);
        noe++;
    }
    
    
    public void cleanAll()
    {
        cods.clear();
        brands.clear();
        models.clear();
        serie.clear();
        forms.clear();
        efficiencies.clear();
        maxtdps.clear();
        modulars.clear();
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
        return serie;
    }
    
    public ArrayList<String> listForms()
    {
        return forms;
    }
    
    public ArrayList<String> listEfficiencies()
    {
        return efficiencies;
    }
    
    public ArrayList<Integer> listMaxTDPs()
    {
        return maxtdps;
    }
    
    public ArrayList<String> listModulars()
    {
        return modulars;
    }
    
    
    public ArrayList<Double> listPrices()
    {
        return prices;
    }
    public int getSize(){
        return noe;
    }
    public void printAll()
    {
        System.out.println(noe);
        for(int i = 0; i < noe; i++)
        {
            System.out.println(cods.get(i) + " " + brands.get(i) + " " +models.get(i) + " " +serie.get(i) +" " + forms.get(i) + " " + efficiencies.get(i) + " " + maxtdps.get(i) + " " + modulars.get(i) + " "+prices.get(i));   
        }
    }
}