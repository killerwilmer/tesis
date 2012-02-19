/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
	$(function() 
	{
		$("ul li:first").show();
		//regular expression for all the fields
		var ck_username = /^[A-Za-z0-9_]{3,20}$/;
                var ck_lastname = /^[A-Za-z0-9_]{3,20}$/;
		var ck_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i 
		var ck_password =  /^[A-Za-z0-9!@#$%^&amp;*()_]{6,20}$/;
                var ck_codigo =  /^[A-Za-z0-9!@#$%^&amp;*()_]{6,20}$/;
		var ck_phone = /^[0-9-]{10,20}$/;
		//Función que se invocará cuando el usuario teclee en el campo "username"
		$('#username').keyup(function()
		{
			var username=$(this).val();
			if (!ck_username.test(username)) 
			{
			 	$(this).next().next().next().show().html("Minimo 3 caracteres");
			}
			else
			{
				$(this).next().next().next().hide();
				$("li").next("li.lastname").slideDown({duration: 'slow',easing: 'easeOutElastic'});
			}
		});
                //Función que se invocará cuando el usuario teclee en el campo "lastname"
		$('#lastname').keyup(function()
		{
			var lastname=$(this).val();
			if (!ck_lastname.test(lastname)) 
			{
			 	$(this).next().next().next().show().html("Minimo 3 caracteres");
			}
			else
			{
				$(this).next().next().next().hide();
				$("li").next("li.tipoUsuario").slideDown({duration: 'slow',easing: 'easeOutElastic'});
                                
			}
		});
                //Función que se invocará cuando el usuario teclee en el campo "lastname"
		$('#codigo').keyup(function()
		{
			var cod=$(this).val();
			if (!ck_codigo.test(cod)) 
			{
			 	$(this).next().show().html("Minimo 6 caracteres");
			}
			else
			{
				$(this).next().hide();
				$("li").next("li.password").slideDown({duration: 'slow',easing: 'easeOutElastic'});
                                $("li").next("li.gInvetigacion").slideDown({duration: 'slow',easing: 'easeOutElastic'});
			}
		});
		//Función que se invocará cuando el usuario teclee en el campo "password"
	        $('#password').keyup(function()
		{
			var password=$(this).val();
			if (!ck_password.test(password)) 
			{
			 	$(this).next().next().next().show().html("Minimum 6 Characters");
			}

		});
                
                $('#password2').keyup(function()
		{
			var password=$(this).val();
			if (!ck_password.test(password)) 
			{
			 	$(this).next().show().html("Minimum 6 Characters");
			}
			else
			{
				$(this).next().hide();
				$("li").next("li.phone").slideDown({duration: 'slow',easing: 'easeOutElastic'});
                                $("li").next("li.email").slideDown({duration: 'slow',easing: 'easeOutElastic'});
			}
		});
                
                
                
		//Función que se invocará cuando el usuario teclee en el campo "email"
		$('#email').keyup(function()
		{
			var email=$(this).val();
			if (!ck_email.test(email)) 
			{
			 	$(this).next().next().next().show().html("Enter valid email");
			}
			else
			{
				$(this).next().next().next().hide();
				$("li").next("li.submit").slideDown({duration: 'slow',easing: 'easeOutElastic'});
			}
		});

		//Al hacer click en el botón de registro
		$('#submit').click(function()
		{
			var email=$("#email").val();
			var username=$("#username").val();
			var password=$("#password").val();
			if(ck_email.test(email) && ck_username.test(username) && ck_password.test(password) )
			{
				$("#form").show().html("<h1>Thank you!</h1><p>You have registered successfully</p>");
			}
			return false;
		});
	})
        