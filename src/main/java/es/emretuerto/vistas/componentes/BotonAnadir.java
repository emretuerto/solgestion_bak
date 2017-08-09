/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto.vistas.componentes;

import javax.swing.ImageIcon;
import javax.swing.JButton;

/**
 *
 * @author eduardo
 */
public class BotonAnadir extends JButton{
    
    ImageIcon icono = new ImageIcon("anadir.png");

    public BotonAnadir() {
     //  configurar();
    
   
    }

private void configurar(){
    setIcon(icono);
}
    
}
