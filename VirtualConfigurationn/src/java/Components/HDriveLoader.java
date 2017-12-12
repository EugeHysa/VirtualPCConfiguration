/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Components;

import java.util.ArrayList;

/**
 *
 * @author user
 */
public class HDriveLoader {
    
    private ArrayList<Integer> cods = new ArrayList<>();
    private ArrayList<String> brands = new ArrayList<>();
    private ArrayList<String> models = new ArrayList<>();
    private ArrayList<String> serie = new ArrayList<>();
    private ArrayList<String> forms = new ArrayList<>();
    private ArrayList<String> types = new ArrayList<>();
    private ArrayList<Integer> sizes = new ArrayList<>();
    private ArrayList<Integer> tdps = new ArrayList<>();
    private ArrayList<Integer> caches = new ArrayList<>();
    //private ArrayList<Integer> qts = new ArrayList<>();
    private ArrayList<Double> prices = new ArrayList<>();
    private int noe;
    
    public void fillLoader(int cod, String brand, String model, String series, String form, String type, int size, int tdp, int cache, Double price)
    {
        cods.add(cod);
        brands.add(brand);
        models.add(model);
        serie.add(series);
        forms.add(form);
        types.add(type);
        sizes.add(size);
        tdps.add(tdp);
        caches.add(cache);
        //qts.add(quantity);
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
        types.clear();
        sizes.clear();
        tdps.clear();
        caches.clear();
        //qts.clear();
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
    
    public ArrayList<String> listTypes()
    {
        return types;
    }
    
    public ArrayList<Integer> listSizes()
    {
        return sizes;
    }
    
    public ArrayList<Integer> listTDPs()
    {
        return tdps;
    }
    
    public ArrayList<Integer> listCaches()
    {
        return caches;
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
            System.out.println(brands.get(i) + " " +models.get(i) +" " + serie.get(i) + " " + forms.get(i) + " " + types.get(i) + " " + sizes.get(i) + " " + tdps.get(i) + " " + caches.get(i) + " " + prices.get(i));
        }
    }
    
}
