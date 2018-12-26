/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto.servicios.impl;

import es.emretuerto.dao.FototipoRepository;
import es.emretuerto.modelo.Fototipo;
import es.emretuerto.servicios.FototipoServicioInterface;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author eduardo
 */

@Service
@Transactional
public class FototipoServicioImpl implements FototipoServicioInterface{

    @Autowired
    public FototipoRepository dao;
    
    
    @Override
    public ArrayList<Fototipo> obtenerFototipos() {
        return (ArrayList<Fototipo>) dao.findAll();
    }
    
}
