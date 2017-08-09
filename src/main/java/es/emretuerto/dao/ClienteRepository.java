/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto.dao;

import es.emretuerto.dto.ClienteDTO;
import es.emretuerto.modelo.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ClienteRepository extends JpaRepository<Cliente, Integer>{
    
    Cliente findByCodigoCliente(String codigo);
    
    
    Cliente findClienteByNif(String nif);
    
    
    ClienteDTO findClienteDTOByNif(String nif);
    
    
    
    
}
