
package es.emretuerto.dao;

import es.emretuerto.modelo.Sesion;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author eduardo
 */
public interface SesionRepository extends JpaRepository<Sesion, Long>{
    
}
