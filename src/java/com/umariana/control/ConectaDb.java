package com.umariana.control;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrador
 */
public class ConectaDb {

    public String idenTrabajador;
    public String usuario = "postgres";
    public String clave = "postgres007";
    public String driver = "org.postgresql.Driver";
    public String cadenaConexion = "jdbc:postgresql://localhost:5432/proyecto";

    public String getCadenaConexion() {
        return cadenaConexion;
    }

    public void setCadenaConexion(String cadenaConexion) {
        this.cadenaConexion = cadenaConexion;
    }
    Connection conexion = null;

    public Connection getConexion() throws SQLException {
        conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
        return conexion;
    }

//*********************************************************************
//Metodo Constructor para la clase conectar
//*********************************************************************
    
    public ConectaDb() {
        try {
            Class.forName(driver).newInstance();
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
    }

   
//*********************************************************************
//Metodo para Generar las consultas
//*********************************************************************
    
    public ResultSet consultas(String cadConsulta) throws SQLException {
        ResultSet resultado = null;
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                resultado = sentencia.executeQuery(cadConsulta);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexion.close();
        }
        return resultado;
    }

    // ---------------------fin del metodo
    public boolean ejecutarOperacion(String cadenaSql) throws SQLException {
        //boolean ejecuta= false;
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                sentencia.execute(cadenaSql);
                sentencia.close();
                return true;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexion.close();
        }
        return false;
    }

    //--------------------------metodo retornar valor---------------------
    public String retornoCodigo(String inicio, String campo, String fin) throws SQLException {
        String date = "";
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                ResultSet iden = null;
                String cadeCodigo = inicio + campo + fin;
                Statement sentencia = conexion.createStatement();
                iden = sentencia.executeQuery(cadeCodigo);

                while (iden != null && iden.next()) {
                    date = iden.getString(campo);
                }
                sentencia.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return date;
    }

    public int darTipoUsuario(String inicio, String campo, String fin) throws SQLException {
        int dato = 0;
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                ResultSet iden = null;
                String cadeCodigo = inicio + campo + fin;
                System.out.println(cadeCodigo);
                Statement sentecnia = conexion.createStatement();
                iden = sentecnia.executeQuery(cadeCodigo);

                while (iden != null && iden.next()) {
                    dato = Integer.parseInt(iden.getString(campo));
                }
                sentecnia.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return dato;
    }

//*********************************************************************
//Metodo para buscar un codigo
//*********************************************************************
    
    public boolean iden(String cadCodigo) throws SQLException {
        ResultSet iden = null;
        int i = 0;
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                iden = sentencia.executeQuery(cadCodigo);
                while (iden != null && iden.next()) {
                    i++;
                }
                sentencia.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            conexion.close();
        }
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }
    
//*********************************************************************
//Metodo para generar el combo filtrado de los grupos de investigacion
//*********************************************************************
    
    public String combofiltro(String tabla, String fil) throws SQLException {
        String consulta = "SELECT * from " + tabla + " where idprograma='" + fil + "'";
        String combo = "";
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                ResultSet resultado = sentencia.executeQuery(consulta);
                while (resultado.next() && resultado != null) {
                    combo += "<option value=" + resultado.getString(1) + ">" + resultado.getString(3).toLowerCase() + "</option>";
                }
                sentencia.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return combo + "</select>";
    }
    
//******************************************************************
//Metodo para generar filtro al combo de los campos de investigacion
//******************************************************************
    
    public String combocampo(String tabla, String filtro) throws SQLException {
        String consulta = "SELECT distinct campo.idcampo, campo.nombrecampo from " + tabla + " where grupoinvestigacion.idprograma='" + filtro + "' and grupoinvestigacion.idgrupoinvestigacion=linea.idgrupoinvestigacion and linea.idcampo=campo.idcampo";
        String combo = "";
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                ResultSet resultado = sentencia.executeQuery(consulta);
                while (resultado.next() && resultado != null) {
                    combo += "<option value=" + resultado.getString(1) + ">" + resultado.getString(2).toLowerCase() + "</option>";
                }
                sentencia.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return combo + "</select>";
    }
    
//*******************************************************************
//Metodo para generar un combo filtrado de la linea de investigacion
//*******************************************************************
    
    public String combolineainvestigacion(String tabla, String filtro) throws SQLException {
        String consulta = "SELECT distinct linea.idgrupoinvestigacion, linea.nombrelinea from " + tabla + " where grupoinvestigacion.idprograma='" + filtro + "' and grupoinvestigacion.idgrupoinvestigacion=linea.idgrupoinvestigacion";
        String combo = "";
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                ResultSet resultado = sentencia.executeQuery(consulta);
                while (resultado.next() && resultado != null) {
                    combo += "<option value=" + resultado.getString(1) + ">" + resultado.getString(2).toLowerCase() + "</option>";
                }
                sentencia.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return combo + "</select>";
    }

//******************************
//Metodo para generar un combo
//******************************
    
    public String combo(String tabla) throws SQLException {
        String consulta = "SELECT * from " + tabla + "";
        String combo = "";
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                ResultSet resultado = sentencia.executeQuery(consulta);
                while (resultado.next() && resultado != null) {
                    combo += "<option value=" + resultado.getString(1) + ">" + resultado.getString(3) + "</option>";
                }
                sentencia.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return combo + "</select>";
    }
    
//*****************************************************
//Metodo para generar un combo
//*****************************************************
    
    public String comboprograma(String tabla) throws SQLException {
        String consulta = "SELECT * from " + tabla + "";
        String combo = "";
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                ResultSet resultado = sentencia.executeQuery(consulta);
                while (resultado.next() && resultado != null) {
                    combo += "<option value=" + resultado.getString(1) + ">" + resultado.getString(4).toLowerCase() + "</option>";
                }
                sentencia.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return combo + "</select>";
    }
    
    public String comboestado(String tabla) throws SQLException {
        String consulta = "SELECT * from " + tabla + "";
        String combo = "";
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                ResultSet resultado = sentencia.executeQuery(consulta);
                while (resultado.next() && resultado != null) {
                    combo += "<option value=" + resultado.getString(1) + ">" + resultado.getString(3).toLowerCase() + "</option>";
                }
                sentencia.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return combo + "</select>";
    }
    

    //metodo para retornar el color de la linea
    public String linea(int i) {
        String salida = "";
        if (i % 2 == 0) {
            salida = "<tr bgcolor='#e6e6fa'>";
        } else {
            salida = "<tr bgcolor='#FFFFFF'>";
        }
        return salida;
    }

    public String retornaInt(String inicio, String campo, String fin) throws SQLException {
        String dato = null;
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                ResultSet iden = null;
                String cadeCodigo = inicio + campo + fin;
                Statement sentencia = conexion.createStatement();
                iden = sentencia.executeQuery(cadeCodigo);

                while (iden != null && iden.next()) {
                    dato = iden.getString(1);
                }
                sentencia.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConectaDb.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conexion.close();
        }
        return dato;
    }

    public ArrayList<Vector> ejecutarConsulta(String orden) throws SQLException {
        ResultSet resultado = null;
        ArrayList<Vector> arrayFilas = null;
        try {
            conexion = DriverManager.getConnection(cadenaConexion, usuario, clave);
            if (!conexion.isClosed()) {
                Statement sentencia = conexion.createStatement();
                resultado = sentencia.executeQuery(orden);

                arrayFilas = new ArrayList<Vector>();

                while (resultado.next()) {
                    Vector fila = new Vector();

                    for (int i = 1; i <= resultado.getMetaData().getColumnCount(); i++) {
                        fila.add(resultado.getObject(i));
                    }
                    arrayFilas.add(fila);
                }
                sentencia.close();
            }
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        } finally {
            resultado.close();
            conexion.close();
        }
        return arrayFilas;
    }
}