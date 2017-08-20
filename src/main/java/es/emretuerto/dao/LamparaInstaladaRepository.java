/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto.dao;

import es.emretuerto.modelo.LamparaInstalada;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author eduardo
 */
public interface LamparaInstaladaRepository extends JpaRepository<LamparaInstalada, Integer>{
    
}
