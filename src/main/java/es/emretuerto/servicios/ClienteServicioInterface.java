package es.emretuerto.servicios;

import es.emretuerto.dto.ClienteDTO;

/**
 *
 * @author eduardo
 */
public interface ClienteServicioInterface {

    
    public void altaCliente(ClienteDTO clienteDTO);
    
    public ClienteDTO findByCodigo(String codigo);
    
}
