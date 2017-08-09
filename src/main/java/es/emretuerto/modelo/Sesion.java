package es.emretuerto.modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 *
 * @author eduardo
 */
@Entity
@Table(name = "SESIONES")

public class Sesion implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;

    @Temporal(TemporalType.DATE)
    @Column(updatable = false, name = "FECHA")
    private Date fecha;

    @ManyToOne
    @Cascade(CascadeType.ALL)
    @JoinColumn(name = "CLIENTE_ID", nullable = false)
    private Cliente cliente;
    
    @ManyToOne
    @Cascade(CascadeType.ALL)
    @JoinColumn(name = "SOLARIUM_ID", nullable = false)
    private Solarium solarium;

    @Column(name = "SESIONES_CONSUMIDAS_BONO", nullable = true)
    private Double sesionesConsumidasBono;
    
    @Column(name = "DURACION", nullable = false)
    private Integer duracion;

    public Sesion(Cliente cliente, Solarium solarium, Double sesionesConsumidasBono, Integer duracion) {
        this.fecha = new Date();
        this.cliente = cliente;
        this.solarium = solarium;
        this.sesionesConsumidasBono = sesionesConsumidasBono;
        this.duracion = duracion;
    }

    public Sesion() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Integer getDuracion() {
        return duracion;
    }

    public void setDuracion(Integer duracion) {
        this.duracion = duracion;
    }

    public Solarium getSolarium() {
        return solarium;
    }

    public void setSolarium(Solarium solarium) {
        this.solarium = solarium;
    }

    public Double getSesionesConsumidasBono() {
        return sesionesConsumidasBono;
    }

    public void setSesionesConsumidasBono(Double sesionesConsumidasBono) {
        this.sesionesConsumidasBono = sesionesConsumidasBono;
    }

    @Override
    public String toString() {
        return "Sesion{" + "fecha=" + fecha + ", cliente=" + cliente.getCodigoCliente() + ", solarium=" + solarium.getNombre() + ", sesionesConsumidasBono=" + sesionesConsumidasBono + ", duracion=" + duracion + '}';
    }
    


}
