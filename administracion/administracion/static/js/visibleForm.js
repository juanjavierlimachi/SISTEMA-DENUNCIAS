$(document).ready(function() {
$(".contador").each(function(){
	var longitud = $(this).val().length;
			$(this).parent().find('#longitud_textarea').html('Escriba un maximo 250 caracteres'+longitud);
			$(this).keyup(function(){ 
				var nueva_longitud = $(this).val().length;
				$('#longitud_textarea').html('Escriba un maximo 250 caracteres:        '+nueva_longitud);
				if (nueva_longitud >= 10) {
					$('#longitud_textarea').css('color', 'red');
				}
				else{
					$('#longitud_textarea').css('color', 'black');	
				}
			});
		});
});
