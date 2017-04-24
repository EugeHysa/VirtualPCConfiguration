/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VirtualPCConfigurator;

import OLD.JDBCTest;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import javax.swing.*;




/**
 *
 * @author user
 */
public class LoginForm {
    JTextField username = new JTextField();
    JPasswordField pass = new JPasswordField();
    JDBCTest jt = new JDBCTest();
    JFrame nome = new JFrame("DB Connect");
    JButton jbt = new JButton("Login");
    JLabel jlb1 = new JLabel("Username");
    JLabel jlb2 = new JLabel("Password");
    JLabel jlb3 = new JLabel("Login to");
    JLabel jlb4 = new JLabel("Components database");
    
    public void creaLogin()
    {
        jbt.setBounds(50, 190, 100, 30);
        username.setBounds(50,90,100,30);
        pass.setBounds(50, 140, 100, 30);
        jlb1.setBounds(64, -20, 100, 30);
        jlb1.setSize(200,200);
        jlb2.setBounds(64, 30, 100, 30);
        jlb2.setSize(200,200);
        jlb3.setBounds(70, 10, 100, 30);
        jlb3.setSize(250,20);
        jlb4.setBounds(15, 30, 100, 30);
        jlb4.setSize(250,20);
        jbt.addActionListener(new ActionListener(){
        
            public void actionPerformed(ActionEvent e){
                
                if(username.getText().equals(jt.getUser()) && pass.getText().equals(jt.getPass()))
                {
                    try
                    {
                        jt.connect();
                        
                    }
                    catch(SQLException sq)
                    {
                        
                    }
                }
                else
                {
                    System.err.println("Username e password errati. Riprovare.");
                }
                nome.dispose();
            }
        
        
        
        });
        
        
        
        
        
        nome.add(username);
        nome.add(pass);
        nome.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        nome.add(jbt);
        nome.add(jlb1);
        nome.add(jlb2);
        nome.add(jlb3);
        nome.add(jlb4);
        nome.setSize(200,270);
        nome.setLayout(null);
        nome.setVisible(true);
        
        
        
    }
    
    
    public static void main(String[] args)
    {
        LoginForm rd = new LoginForm();
        rd.creaLogin();
    }
    
}
