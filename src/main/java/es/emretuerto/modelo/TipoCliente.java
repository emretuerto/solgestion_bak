package es.emretuerto.modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author eduardo
 */
@Entity
@Table(name = "TIPO_CLIENTES")
public class TipoCliente  implements Serializable{

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "CODIGO", length = 4, nullable = false, unique = true)
    private String codigo;

    @Column(name = "DESCRIPCION", length = 60)
    private String descripcion;

//    @OneToMany(mappedBy = "id")
//    private List<Cliente> clientesTipo;
    
    
    public TipoCliente(String codigo, String descripcion) {
        this.codigo = codigo;
        this.descripcion = descripcion;
    }

    public TipoCliente() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "TipoCliente{" + "id=" + id + ", codigo=" + codigo + ", descripcion=" + descripcion + '}';
    }


    
    
}
