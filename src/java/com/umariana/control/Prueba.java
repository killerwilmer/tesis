/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.umariana.control;

/**
 *
 * @author cristhianlombana
 */
public class Prueba {

    public Prueba() {
    }

    public static void main(String args[]) {
        ConectaDb control = new ConectaDb();
        int desProyecto = -1;

        try {
            String inicio2 = "select ";
            String campo2 = "count(usuarioevaluador.idusuario )";
            String fin2 = " from usuario, usuarioevaluador where usuario.idusuario=usuarioevaluador.idusuario and usuarioevaluador.idusuario=" + 11 + ";";
            desProyecto = control.darTipoUsuario(inicio2, campo2, fin2);
        } catch (Exception e) {
            System.out.print(e);
        }



        System.out.print(" " + desProyecto);
    }
}
