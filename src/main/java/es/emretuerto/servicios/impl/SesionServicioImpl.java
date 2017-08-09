/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto.servicios.impl;

import es.emretuerto.dao.SesionRepository;
import es.emretuerto.modelo.Bono;
import es.emretuerto.modelo.Cliente;
import es.emretuerto.modelo.Sesion;
import es.emretuerto.modelo.Solarium;
import es.emretuerto.servicios.BonoServicioInterface;
import es.emretuerto.servicios.SesionServicioInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author eduardo
 */
@Service
public class SesionServicioImpl implements SesionServicioInterface{
    
    @Autowired
    SesionRepository sesionDao;
    
    @Autowired
    BonoServicioInterface bonoServicio;

    @Override
    @Transactional
    public void insertarSesion(Cliente cliente, Solarium solarium,Double sesionesConsumidasBono, Integer minutosConsumidos) {
        
        Sesion sesion = new Sesion(cliente, solarium,sesionesConsumidasBono, minutosConsumidos);
        
        Bono bono = cliente.getBono();
        if (bono!= null){
            if(bono.getEsDeMinutos()){
                bonoServicio.restarMinutosBono(bono, minutosConsumidos);
            }
            else{
                bonoServicio.restarSesionesBono(bono, sesionesConsumidasBono);
            }
        }
        
        sesionDao.save(sesion);
    }
    
    
    
}
