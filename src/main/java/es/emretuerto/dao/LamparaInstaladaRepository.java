/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto.dao;

import es.emretuerto.modelo.LamparaInstalada;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author eduardo
 */
public interface LamparaInstaladaRepository extends JpaRepository<LamparaInstalada, Integer>{
 
        @Query("select li from LamparaInstalada li where li.fechaRetirada is null and li.maquina.id = ?1")
    List<LamparaInstalada> obtenerLamparasActivas(Integer idmaquina);
  
    
}
