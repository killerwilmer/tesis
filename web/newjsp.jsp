<%-- 
    Document   : newjsp
    Created on : 05-mar-2012, 1:24:44
    Author     : usuarui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!--
	This is a jQuery Tools standalone demo. Feel free to copy/paste.
	                                                         
	http://flowplayer.org/tools/demos/
	
	Do *not* reference CSS files and images from flowplayer.org when in production  

	Enjoy!
-->

<head>
	<title>jQuery Tools standalone demo</title>

	<!-- include the Tools -->
	<script src="http://cdn.jquerytools.org/1.2.6/full/jquery.tools.min.js"></script>
	 


	<!-- tooltip styling -->
	<link rel="stylesheet" type="text/css" href="http://static.flowplayer.org/tools/css/tooltip-generic.css"/> 

	
</head>

<body>
	



<form id="myformd" action="#">

	<h3>Registration Form</h3>

	<div id="inputs">

		<!-- username -->
		<label for="username">Username</label>
		<input id="username" title="Must be at least 8 characters."/><br />

		<!-- password -->
		<label for="password">Password</label>
		<input id="password" type="password" title="Try to make it hard to guess." /><br />

		<!-- email -->
		<label for="email">Email</label>
		<input id="email" title="We won't send you any marketing material." /><br />

		<!-- message -->
		<label for="body">Message</label>
		<textarea id="body" title="What's on your mind?"></textarea><br />

		<!-- message -->
		<label for="where">Select one</label>
		<select id="where" title="Select one of these options">
			<option>-- first option --</option>
			<option>-- second option --</option>
			<option>-- third option --</option>
		</select>
		<br />
	</div>

	<!-- email -->
	<label>
		I accept the terms and conditions
		<input type="checkbox" id="check" title="Required to proceed" />
	</label>

	<p>
		<button type="button" title="This button won't do anything">Proceed</button>
	</p>

</form>

<!-- javascript coding -->
<script>
// execute your scripts when the DOM is ready. this is a good habit
$(function() {



// select all desired input fields and attach tooltips to them
$("#myformd :input").tooltip({

	// place tooltip on the right edge
	position: "center right",

	// a little tweaking of the position
	offset: [-2, 10],

	// use the built-in fadeIn/fadeOut effect
	effect: "fade",

	// custom opacity setting
	opacity: 0.7

});
});
</script>



</body>

</html>
