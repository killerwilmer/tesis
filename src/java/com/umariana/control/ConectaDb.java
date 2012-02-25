/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.umariana.control;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;

/**
 *
 * @author Administrador
 */
public class ConectaDb {
    private String user,pass,urlConectar,driver;// definicion de variables para la coneccion
    public Connection conection; // variable de la clase conect para conectar la base de datos
    private java.sql.Statement statement; // estatement controla las coneciones y las ejecuciones de las sql
    public String idenTrabajador;
    private Statement st=null; 
    //---------------------metodo constructor para la clase conectar

    public ConectaDb()
    {
        user="postgres";
        pass="postgres";
        driver="org.postgresql.Driver";
        urlConectar="jdbc:postgresql://localhost:5433/proyecto";
        try {
            Class.forName(driver);
            conection=DriverManager.getConnection(urlConectar,user,pass);
            System.out.println("SI SE CONECTA A LA DB");

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();

        }catch (SQLException ex) {
            ex.printStackTrace();
            System.err.println("No conecto a la db");
        }
    }
    //---------------------fin del constructor
    //-------------------metodo para cerrar la coneccion a la db
    public void cerrar() {
        try {
            conection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    //metodo para Generar las consultas
    public ResultSet consultas(String cadConsulta){
        ResultSet resultado = null;
        try {
            statement=conection.createStatement();
            resultado=statement.executeQuery(cadConsulta);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return resultado;
    }
    //------------------------------
    //----------------------metodo modelo de la lista para aplicaciones de escritorio
     public DefaultComboBoxModel modelo(String parteUno,String  campo1,String finCadena){
        DefaultComboBoxModel llenaLista = new DefaultComboBoxModel();
        ResultSet datos = null;
        String cadLista =parteUno +campo1 +finCadena;
        try {

            statement = conection.createStatement();
            datos = statement.executeQuery(cadLista);
            while(datos != null && datos.next()){
                String cadena = datos.getString(campo1);
                //System.err.println(dato);
                llenaLista.addElement(cadena);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return llenaLista;
    }
    //------------------------
    //-----------------------------fin del metodo
    //----------------metodo para cerrar el resultado
      public void cierraResultado(ResultSet resutado){
        try {

            resutado.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    // ---------------------fin del metodo
       public boolean transaccion(String cadenaSql){
        //boolean ejecuta= false;
        try {
            statement=conection.createStatement();
            statement.execute(cadenaSql);
            statement.close();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    //----------------------fin del metodo


           //--------------------------metodo retornar valor---------------------

    public String retornoCodigo(String inicio, String campo, String fin){
        String dato="";
        try {
            ResultSet iden = null;
            String cadeCodigo = inicio + campo + fin;
            System.out.println(cadeCodigo);
            statement = conection.createStatement();
            iden = statement.executeQuery(cadeCodigo);

            while (iden != null && iden.next()) {
                dato = iden.getString(campo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dato;
    }
    
    
        public int darTipoUsuario(String inicio, String campo, String fin){
        int dato = 0;
        try {
            ResultSet iden = null;
            String cadeCodigo = inicio + campo + fin;
            System.out.println(cadeCodigo);
            statement = conection.createStatement();
            iden = statement.executeQuery(cadeCodigo);

            while (iden != null && iden.next()) {
                dato = Integer.parseInt(iden.getString(campo));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dato;
    }

        //----------------------funcion para buscar un codigo

    public boolean iden(String cadCodigo){
        ResultSet iden= null;
        int i=0;
        try {
            statement = conection.createStatement();
            iden= statement.executeQuery(cadCodigo);
            while(iden != null &&iden.next()){
                i++;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        if(i>0){
            return true;
        } else{
            return false;
        }
    }

    //Metodo para generar un combo
    public String combo ( String tabla )
    {
        String consulta = "SELECT * from " + tabla + "";
        String combo = "<select name='combo'>";
        try
        {
            ResultSet resultado = this.consultas(consulta);
            while ( resultado.next() && resultado != null )
            {
                combo+= "<option value=" + resultado.getString(1) + ">" + resultado.getString(2) + "</option>";
            }
        }
        catch (SQLException ex)
        {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return combo + "</select>";
    }


     //metodo para retornar el color de la linea

    public String linea(int i){
    String salida="";
          if(i%2==0){
            salida="<tr bgcolor='#e6e6fa'>";
          }else{
          salida="<tr bgcolor='#FFFFFF'>";
          }
    return salida;
    }

        public String retornaInt(String inicio, String campo, String fin){
        String dato = null;
        try {
            ResultSet iden = null;
            String cadeCodigo = inicio + campo + fin;
            System.out.println(cadeCodigo);
            statement = conection.createStatement();
            iden = statement.executeQuery(cadeCodigo);

            while (iden != null && iden.next()) {
                dato = iden.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dato;
    }
}
