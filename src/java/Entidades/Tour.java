/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author usuario1
 */
public class Tour {
    String   fecha, nomTur, corTur, ruta, status;
    
    int duracion, turista, guia, costo, id;
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomTur() {
        return nomTur;
    }

    public void setNomTur(String nomTur) {
        this.nomTur = nomTur;
    }

    public String getCorTur() {
        return corTur;
    }

    public void setCorTur(String corTur) {
        this.corTur = corTur;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getTurista() {
        return turista;
    }

    public void setTurista(int turista) {
        this.turista = turista;
    }

    public int getGuia() {
        return guia;
    }

    public void setGuia(int guia) {
        this.guia = guia;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

   
    
}
