/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto;

import es.emretuerto.dao.LamparaRepository;
import es.emretuerto.dao.MaquinaRepository;
import es.emretuerto.dao.PotenciaRepository;
import es.emretuerto.modelo.Lampara;
import es.emretuerto.modelo.Maquina;
import es.emretuerto.modelo.Potencia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author emretuerto
 */
@Service
public class GeneraDatos {

    @Autowired
    PotenciaRepository potenciaDao;

    @Autowired
    LamparaRepository lamparaDao;
    
    @Autowired
    MaquinaRepository maquinaDao;

    public void generaPotencias() {

        Potencia potencia1 = new Potencia("80", 80);
        Potencia potencia2 = new Potencia("100", 100);
        Potencia potencia3 = new Potencia("120", 120);
        Potencia potencia4 = new Potencia("140", 140);
        Potencia potencia5 = new Potencia("160", 160);
        Potencia potencia6 = new Potencia("180", 180);

        potenciaDao.save(potencia1);
        potenciaDao.save(potencia2);
        potenciaDao.save(potencia3);
        potenciaDao.save(potencia4);
        potenciaDao.save(potencia5);
        potenciaDao.save(potencia6);

    }

    public void generaLamparas() {

        Potencia potencia1 = potenciaDao.findOne(1);
        Lampara lampara1 = new Lampara("0001", "Sylvania", "Purebronce 100 1.2", 800, 17.5d, potencia1);
        Potencia potencia2 = potenciaDao.findOne(2);
        Lampara lampara2 = new Lampara("0002", "Sylvania", "CaralSol", 1000, 25.5d, potencia2);
        Potencia potencia3 = potenciaDao.findOne(6);
        Lampara lampara3 = new Lampara("0003", "Sylvania", "Chamuscator", 2800, 140.99d, potencia3);

        lamparaDao.save(lampara1);
        lamparaDao.save(lampara2);
        lamparaDao.save(lampara3);
    }

    public void generarMaquinas() {

        Maquina maquina1 = new Maquina("Cabina 1", "Ergoline", "23/1");
        Maquina maquina2 = new Maquina("Cabina 2", "Solpasion", "Mega Super");
        Maquina maquina3 = new Maquina("Cabina 3", "Soltron", "Bronceator");

        maquinaDao.save(maquina1);
        maquinaDao.save(maquina2);
        maquinaDao.save(maquina3);
    }
}
