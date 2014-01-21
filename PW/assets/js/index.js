var found = false;
$('.descr').click(function(e) {
	e.preventDefault();
	if (!found) {
		$('.descr.selected').removeClass('selected');
		$(this).addClass('selected');
		if ($('.descr.selected').length > 0 && $('.image.selected').length > 0) {
			check_match();
		}
	}

});
$('.image').click(function(e) {
	e.preventDefault();
	if (!found) {
		$('.image.selected').removeClass('selected');
		$(this).addClass('selected');
		if ($('.descr.selected').length > 0 && $('.image.selected').length > 0) {
			check_match();
		}
	}

});
function check_match() {
	var descr = $('.descr.selected').text();
	console.log(descr);
	var img = $('.image.selected').attr('src');
	console.log(img);
	found = true;
	$.post('check.jsp', {img: img, descr:descr}, function(data) {
		data = JSON.parse(data);
		console.log(data);
		if (data[0] == '1') {
			$('.selected').addClass('correct');
			$('#correct_matches tbody').append('<tr><td><span class="descr">'+descr+'<span></td><td><img src="'+img+'" class="image"/></td></tr>');
			setTimeout(function() {
				var p1 = $('.descr.selected').parent().parent();
				var p2 = $('.image.selected').parent().parent();
				if (p1 == p2) {
					p1.remove();
				} else {
					var sibling = $('.descr.selected').parent().siblings().children();
					$('.image.selected').replaceWith(sibling);
					p1.remove();
					
				}
				found = false;
			}, 3000);
			if ($('#picture_list tbody').children().length == 1)  {
				$.get('check_time.jsp', function(data) {
					data = JSON.parse(data);
					console.log(data);
					if (data[0] < 3) {
						var name = prompt("Felicitari! Sunteti pe locul "+ (data[0] + 1)+ "! Dati numele vostru pentru highscore","Betmen");

						if (name != null) {
							$.post('add_hall.jsp', {name: name}, function(data) {
								window.location = 'add_photos.jsp';
							});
						}
					}
					else {
						alert("Ne pare rau, nu ati fost suficient de rapid, ati fost pe locul: "+(data[0] + 1));
					}
				});
			}
		} else {
			$('.selected').addClass('error');
			setTimeout(function() {
				$('.selected').removeClass('error').removeClass('selected');
				found = false;
			}, 1000);
		}
	});
}