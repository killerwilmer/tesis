/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.umariana.logicanegocio.interfaces;

import java.util.ArrayList;

/**
 *
 * @author skynet
 */
public interface ICrud {
    	public int crear(Object obj);
	public boolean modificar(Object obj);
	public boolean eliminar(Object obj);
	public Object consultarUno(int id);
	public ArrayList<Object> consultarTodos();
	public ArrayList<Object> consultarLike(String parte);
}
