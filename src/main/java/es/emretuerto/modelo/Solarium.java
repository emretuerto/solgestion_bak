/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.emretuerto.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
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
@Table(name = "SOLARIUMS")
public class Solarium implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer id;
    
    @Column(name = "NOMBRE", length = 50, nullable = false, unique = true)
    private String nombre;
    
    @Column(name = "MARCA", length = 50, nullable = true, unique = false)
    private String marca;
    
    @Column(name = "MODELO", length = 50, nullable = true, unique = false)
    private String modelo;
    
    @OneToMany(mappedBy = "solarium", cascade = CascadeType.ALL)
    @Column(name = "SESION_ID")
    private List<Sesion> sesiones = new ArrayList<Sesion>();
    
    public Solarium(String nombre, String marca, String modelo) {
        this.nombre = nombre;
        this.marca = marca;
        this.modelo = modelo;
    }
    
    public Solarium() {
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getMarca() {
        return marca;
    }
    
    public void setMarca(String marca) {
        this.marca = marca;
    }
    
    public String getModelo() {
        return modelo;
    }
    
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    
    public List<Sesion> getSesiones() {
        return sesiones;
    }
    
    public void setSesiones(List<Sesion> sesiones) {
        this.sesiones = sesiones;
        sesiones.forEach((s) -> {
            s.setSolarium(this);
        });
    }
    
    public void addSesion(Sesion sesion) {
        if (!sesiones.contains(sesion)) {
            sesiones.add(sesion);
            sesion.setSolarium(this);
        }
    }
    
    public void removeSesion(Sesion sesion) {
        if (sesiones.contains(sesion)) {
            sesiones.remove(sesion);
            sesion.setSolarium(null);
        }
    }
    
    @Override
    public String toString() {
        return "Solarium{" + "id=" + id + ", nombre=" + nombre + ", marca=" + marca + ", modelo=" + modelo + ", sesiones=" + sesiones + '}';
    }
    
}
