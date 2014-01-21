<div class="navbar navbar-inverse" role="navigation">
  <div class="container">
	<div class="navbar-header">
	  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	  </button>
	  <a class="navbar-brand" href="#">Image Matcher</a>
	</div>
	<div class="collapse navbar-collapse">
	  <ul class="nav navbar-nav">
		<li><a href="index.jsp">Home</a></li>
		<li><a href="hof.jsp">Hall of Fame</a></li>
		<% if(null != session.getAttribute("winner")) { %>
			<li><a href="add_photos.jsp">Adauga poze</a></li>
		<% } %>
	  </ul>
	</div><!--/.nav-collapse -->
  </div>
</div>