<%-- 
    Document   : correcciones
    Created on : 04-oct-2012, 18:34:55
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="ckeditor.js"></script>
        <script type="text/javascript" src="sample.js"></script>
        
        <script type="text/javascript">
            //<![CDATA[      
            var editor;          
            // The instanceReady event is fired, when an instance of CKEditor has finished
            // its initialization.
            CKEDITOR.on( 'instanceReady', function( ev )
            {
                editor = ev.editor;               
                // Show this "on" button.
                document.getElementById( 'readOnlyOn' ).style.display = '';               
                // Event fired when the readOnly property changes.
                editor.on( 'readOnly', function()
                {
                    document.getElementById( 'readOnlyOn' ).style.display = this.readOnly ? 'none' : '';
                    document.getElementById( 'readOnlyOff' ).style.display = this.readOnly ? '' : 'none';
                });
            });
            
            function toggleReadOnly( isReadOnly )
            {
                // Change the read-only state of the editor.
                // http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.editor.html#setReadOnly
                editor.setReadOnly( isReadOnly );
            }   
            
            instance = CKEDITOR.instances['editor1'];
            if(instance)
            {
                CKEDITOR.remove(instance);
            }
            CKEDITOR.replace( 'editor1');
         
            //]]>
        </script>

    </head>
    <body>
        <form>
        <p>
            <textarea class="ckeditor" id="editor1" name="editor1" cols="100" rows="10"></textarea>
        </p>
        <p>
            <input id="readOnlyOn" onclick="toggleReadOnly();" type="button" value="Make it read-only" style="display:none" />
            <input id="readOnlyOff" onclick="toggleReadOnly( false );" type="button" value="Make it editable again" style="display:none" />
        </p> 
        </form>
    </body>
</html>
