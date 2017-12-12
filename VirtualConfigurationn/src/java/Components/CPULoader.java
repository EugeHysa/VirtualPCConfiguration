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
public class CPULoader {
    private ArrayList<Integer> cods = new ArrayList<>();
    private ArrayList<String> brands = new ArrayList<>();
    private ArrayList<String> models = new ArrayList<>();
    private ArrayList<String> sockets = new ArrayList<>();
    private ArrayList<Double> frequencies = new ArrayList<>();
    private ArrayList<Integer> cores = new ArrayList<>();
    private ArrayList<Integer> tdps = new ArrayList<>();
    private ArrayList<Double> prices = new ArrayList<>();
    private int noe;
    
    
    public void fillLoader(int cod, String brand, String model, String socket, Double frequency, int core, int tdp, Double price)
    {
        cods.add(cod);
        brands.add(brand);
        models.add(model);
        sockets.add(socket);
        frequencies.add(frequency);
        cores.add(core);
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
        frequencies.clear();
        cores.clear();
        tdps.clear();
        prices.clear();
        noe = 0;
    }

    
    public ArrayList<String> listBrands()
    {
        return brands;
    }
    
    public ArrayList<String> listModels()
    {
        return models;
    }
    
    public ArrayList<String> listSockets()
    {
        return sockets;
    }
    
    public ArrayList<Double> listFrequencies()
    {
        return frequencies;
    }
    
    public ArrayList<Integer> listCores()
    {
        return cores;
    }
    
    public ArrayList<Integer> listTDPs()
    {
        return tdps;
    }
   
    
    public ArrayList<Double> listPrices()
    {
        return prices;
    }
    
    public ArrayList<Integer> listCods()
    {
        return cods;
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
            
            System.out.println(cods.get(i)+ " " + brands.get(i) + " " +models.get(i) +" " + sockets.get(i) + " " + frequencies.get(i) + " " + cores.get(i) + " " + tdps.get(i) + " "+prices.get(i));
            
        }
    }
    
    
    
}
