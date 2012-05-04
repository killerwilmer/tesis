<%-- 
    Document   : insert1
    Created on : 02-may-2012, 8:39:32
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="jquerymin.js"></script>
        <script type="text/javascript" >
            $(function() {
                $(".comment_button").click(function() {
                    
                    var test = $('#cke_contents_content iframe').contents().find( 'body' ).html();
                    var dataString = 'content='+ test;
                    
                    if(test=='')
                    {
                        alert("Please Ingrese Algun Texto");
                    }
                    else
                    {
                        $("#flash").show();
                        $("#flash").fadeIn(400).html('<img src="ajax-loader.gif" align="absmiddle"> <span class="loading">Insertando ...</span>');
                        
                        $.ajax({
                            type: "POST",
                            url: "insert2.jsp",
                            data: dataString,
                            cache: false,
                            success: function(html){
                                $("#display").after(html);
                                //document.getElementById('content').value='';
                                document.getElementById('content').focus();                                
                                $("#flash").hide();
                            }
                        });
                    } return false;
                });
            });
        </script>
        <title>My Tesis</title>
    </head>
    <body>
        <div>
            <form method="post" name="form" action="">
                <textarea cols="30" rows="2" name="content" id="content">
                </textarea><br />
                <input type="submit" value="Registrar" name="submit" class="comment_button"/>
            </form>
            <ckeditor:replace replace="content" basePath="/ckeditor/" />
        </div>
        <div id="flash"></div>
        <div id="display"></div>
    </body>
</html>