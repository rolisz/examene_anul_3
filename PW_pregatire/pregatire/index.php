<!DOCTYPE html>
<html>
<head>
	<title>Bine ati venit la autogara!</title>
</head>
<body>
	<h1>Va rugam sa va autentificati!</h1>
	<form action="login.php" method="post"> <!-- get vs post: get prin url, post altfel (prin headere http) -->
		<ul>
			<li><label for="user">Username:</label><input type="text" name="user" id="user"></li>
			<li><label for="pass">Password:</label><input type="password" name="pass" id="pass"></li>
			<li><input type="submit" value="Log In"></li>
		</ul>
	</form>
</body>
</html>