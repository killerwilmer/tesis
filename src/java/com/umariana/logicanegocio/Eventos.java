/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.umariana.logicanegocio;

import com.umariana.control.ConectaDb;
import com.umariana.logicanegocio.interfaces.ICrud;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author skynet
 */
public class Eventos implements ICrud {

    int idEvento;
    int idUsuario;
    String titulo;
    String descripcion;
    String foto;
    int orden;

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdusuario() {
        return idUsuario;
    }

    public void setIdusuario(int idusuario) {
        this.idUsuario = idusuario;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    @Override
    public int crear(Object obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean modificar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object consultarUno(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<Object> consultarTodos() {
        Eventos event = null;
        ConectaDb con = new ConectaDb();

        ArrayList<Object> lista = null;

        try {
            ArrayList<Vector> res = new ArrayList<Vector>();
            String sql = "select idevento, idusuario, tituloevento, descripcionevento, fotoevento, ordenevento from evento";

            res = con.ejecutarConsulta(sql);

            if (res.size() > 0) {

                lista = new ArrayList<Object>();

                for (Vector v : res) {
                    event = new Eventos();
                    event.setIdEvento(Integer.valueOf(v.get(0).toString()));
                    event.setIdusuario(Integer.parseInt(v.get(1).toString()));
                    event.setTitulo(v.get(2).toString());
                    event.setDescripcion(v.get(3).toString());
                    event.setFoto(v.get(4).toString());
                    event.setOrden(Integer.parseInt(v.get(5).toString()));
                    lista.add(event);
                }

            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return lista;
    }

    @Override
    public ArrayList<Object> consultarLike(String parte) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
