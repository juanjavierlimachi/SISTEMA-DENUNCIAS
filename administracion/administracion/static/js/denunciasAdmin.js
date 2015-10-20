
var socket = io.connect("http://localhost:3000");
$('#boton').on('click',	Comentar);
	function Comentar(e){
		e.preventDefault();
		document.getElementById('boton').value="Enviando...";
		document.getElementById('boton').disabled=true;
		$('.icon').show();
		var datos = {
			user: $('#id_user').val(),
			comment:$('#id_comment').val(),
			idNegocio:$('#id_idNegocio').val(),
			Tipo_de_peticion:$('#id_Tipo_de_peticion').val()
		}
		//console.log(datos);
		//var info=datos.comment.length;
		if(datos.user.length==0 || datos.comment.length<10 || datos.idNegocio.length == 0){
			alert('Por favor Escriba una Denuncia....');
			document.getElementById('boton').disabled=false;
			$('.icon').hide();
			return false;
		}
		else{
			socket.emit('nuevo comentario', datos);
			navigator.geolocation.getCurrentPosition(ubicacion,error);
			   function ubicacion(posicion)
				{
				    var contenedor = document.getElementById("ubicacion");
				    var latitud = posicion.coords.latitude;
				    var longitud = posicion.coords.longitude;
				    var precision = posicion.coords.accuracy;
				    coordenadas={
				    	lat:posicion.coords.latitude,
				    	lng:posicion.coords.longitude
				    }
				    socket.emit('UbicacionCliente', coordenadas);
				     //alert("Lat="+latitud+" - Long="+longitud+" - Precision="+precision);
				     alert("Su reclamo fue enviada correctamente");
				     document.getElementById('boton').disabled=false;
				     $('.icon').hide();
				}    
				function error(error)
			     {
				     if(error.code == 0)
				      alert("Error Desconocido");
				     else if(error.code == 1)
				      alert("No fue posible contactarte");
				     else if(error.code == 2)
				      alert("No hay una ubicacion disponible");
				     else if(error.code == 3)
				      alert("Tiempo agotado");
				     else 
				      alert("Error Desconocido");
				  }
		}
	}
	/*escucho un evento ObetenerUbicacion para dibijar el mapa*/
	socket.on('ObtenerUbicacion',DatosUbicacion);
	function DatosUbicacion(ubicacion){
		//console.log(ubicacion);
		iniciar(ubicacion);
	}
	function iniciar(ubicacion) {
		console.log(ubicacion.lat);
		console.log(ubicacion.lng);
		var mapOptions = {
			center: new google.maps.LatLng(ubicacion.lat, ubicacion.lng),
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map_canvass"),mapOptions);
		var pos = new google.maps.LatLng(ubicacion.lat, ubicacion.lng);
		marker = new google.maps.Marker({
            position: pos,
            map: map,
            title:"Ubicacion",
            animation: google.maps.Animation.DROP
        });
	}
	socket.on('devolviendo comentario', function(data){
		var data =JSON.parse(data);
		$("#comentario").prepend("<li>"+data.user+ "   Denuncio     " +data.comment+"     Cod    "+data.idNegocio+"</li>");
		$("#id_comment").val("");

		var playing = true;
        $(this).toggleClass("down");
        if (playing == true) {
            document.getElementById('player').play();
        }
	});