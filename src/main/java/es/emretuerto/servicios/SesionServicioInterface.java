/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto.servicios;

import es.emretuerto.modelo.Cliente;
import es.emretuerto.modelo.Solarium;

/**
 *
 * @author eduardo
 */
public interface SesionServicioInterface {
    
    public void insertarSesion(Cliente cliente, Solarium solarium, Double sesionesConsumidas,Integer minutos);
    
}
