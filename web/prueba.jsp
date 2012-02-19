<%-- 
    Document   : registro
    Created on : 23/10/2011, 01:37:25 AM
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="chrome=1" />

        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <link rel="stylesheet" href="recursos/Css/registro.css" type="text/css" media="screen" />         
        
        <script src="recursos/Js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="recursos/Js/registro.js" type="text/javascript"></script>
        
        <title>Registro Usuarios</title>
        <script>
    $(document).ready(function(){
        $('#form-elements').html5form();    
    });
</script>
    </head>
    <body>
        <div id="form">           
            <form id="form-elements" method="post">
                <h2>Registro Usuario</h2>
                <fieldset style="background:#3a4245 url(recursos/Imagenes/index/transparente.png)">
      
                    <ul>
                    <li class="username"><label>Nombre: </label>
                        <input id="username" name="name" type="text" required placeholder="Nombre"/>
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre 2:</label>
                        <input id="username2" name="name2" type="text" /><span class="error"> </span>
                    </li>
                    
                    <li class="lastname"><label>Apellido: </label>
                        <input id="lastname" name="lastname" type="text" required placeholder="Apellido"/>
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Apellido 2: </label>
                        <input id="lastname2" name="lastname2" type="text" /><span class="error"> </span>
                    </li>
                    
                    <li class="tipoUsuario"><label>Tipo Usuario: </label>
                        <select id="tipoUsuario" name="tipoUsuario">
                            <option value="estudiante">Estudiante</option>
                            <option value="docente">Docente</option>
                            <option value="administrativo">Administrativo</option>
                            <option selected="selected" value="otros">Otros</option>
                        </select>                           
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Codigo: </label>
                        <input id="codigo" name="codigo" type="text" required placeholder="124CA"/><span class="error"> </span>
                    </li>
                    
                    <li class="password"><label>Clave: </label>
                        <input id="password" name="password" type="password" required placeholder="12*?jk"/>
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Confirmar: </label>
                        <input id="password2" name="password2" type="password" required placeholder="12*?jk"/><span class="error"> </span>
                    </li>

                    <li class="phone"><label>No Telefono: </label>
                        <input id="phone" name="phone" type="text" />
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No Celular: </label>
                        <input id="celular" name="celular" type="text" />
                        <span class="error"> </span>
                    </li>
                    
                    <li class="email"><label>Email: </label>
                        <input id="email" name="email" type="email" required placeholder="email@example.com"/>
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Imagen: </label>
                        <INPUT id="imagen" name="imagen" type="file"/>
                        <span class="error"> </span>
                    </li>
                    <li class="submit" ><div align="center"><input id="submit" type="submit" value=" Registro "/></div>
                    </li>
                </ul>
              </fieldset>
            </form>
        </div>        
    </body>
    <div></div>
    <div></div>
    <div></div>
</html>


