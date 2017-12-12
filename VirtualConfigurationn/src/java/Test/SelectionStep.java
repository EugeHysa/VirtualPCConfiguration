/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import DatabaseElements.DBFilters;
import java.sql.SQLException;
import java.util.Scanner;

/**
 *
 * @author cl427263
 */
public class SelectionStep {
    
    private DBFilters dbt;
    
    
    public SelectionStep() throws SQLException
    {
        dbt = new DBFilters();
        dbt.Connect();
    }
    
    
    public void selectSh() throws SQLException
    {
        Scanner sc = new Scanner(System.in);
        
        dbt.iSelected();
        
        dbt.iSelected2(sc.nextLine(), sc.nextLine());

        dbt.isSelected3(sc.nextLine(), sc.nextLine());
        
        
        
        
    }
    
    
    
    
    
}
