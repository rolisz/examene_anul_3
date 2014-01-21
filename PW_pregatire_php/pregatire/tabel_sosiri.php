<!DOCTYPE html>
<html>
<head>
	<title>Vizualizare curse care sosesc!</title>
</head>
<body>
<h1>Curse care vor sosi:</h1>
	<ul id="lista">
		
	</ul>
	
<script src="jquery.js"></script>
<script>
	var lista = $('#lista');
	setInterval(function() {
		$.get('get_sosiri.php', function(data) {
			lista.html(''); // golire lista
			data = JSON.parse(data);	
			$.each(data, function(index, value) {
				lista.append('<li>' + value['localitate_plecare'] + ' ' + value['localitate_sosire'] + ' - ' + value['ora_plecare']+':'+value['minut_plecare']+' ' + value['ora_sosire'] + ':' + value['minut_sosire']			+'</li>')
			});
			
		
		});
	}, 3000); //din 3 in 3 secunde
</script>
</body>
</html>