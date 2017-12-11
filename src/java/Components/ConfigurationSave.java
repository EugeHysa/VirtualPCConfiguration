/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Components;

import java.util.ArrayList;



/**
 *
 * @author Utente
 */
public class ConfigurationSave {
   
    
    private String FCod, MBCod, CPUCod, RAMCod, GCCod, HDCod, PSCod, PCCod;
    private Double overallPrice;

    public String getFCod() {
        return FCod;
    }

    public String getMBCod() {
        return MBCod;
    }

    public String getCPUCod() {
        return CPUCod;
    }

    public String getRAMCod() {
        return RAMCod;
    }

    public String getGCCod() {
        return GCCod;
    }

    public String getHDCod() {
        return HDCod;
    }

    public String getPSCod() {
        return PSCod;
    }

    public String getPCCod() {
        return PCCod;
    }

    
    
    public void setPrice(Double overallPrice)
    {
        this.overallPrice = overallPrice;
    }
    
    public String getPrice()
    {
        return overallPrice.toString();
    }
    
    
    public void sumPrice(Double oldPrice)
    {
        overallPrice += oldPrice;
    }

    public void setFCod(String FCod) {
        this.FCod = FCod;
    }

    public void setMBCod(String MBCod) {
        this.MBCod = MBCod;
    }

    public void setCPUCod(String CPUCod) {
        this.CPUCod = CPUCod;
    }

    public void setRAMCod(String RAMCod) {
        this.RAMCod = RAMCod;
    }

    public void setGCCod(String GCCod) {
        this.GCCod = GCCod;
    }

    public void setHDCod(String HDCod) {
        this.HDCod = HDCod;
    }

    public void setPSCod(String PSCod) {
        this.PSCod = PSCod;
    }

    public void setPCCod(String PCCod) {
        this.PCCod = PCCod;
    }
    
    

    
    

    
}
