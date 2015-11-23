var socket = io.connect("http://localhost:3000");
	$('#bo').on('click', Notificar);var cont=0;
	function Notificar(e){
		e.preventDefault();
		var dato = {
			idUser:$('#id_idUser').val(),
			Usuario:$('#id_Usuario').val(),
			descripcion:$('#id_descripcion').val(),
			Codigo:$('#id_Codigo').val(),
			fecha_presentacion:$('#id_fecha_presentacion').val(),
			hora:$('#id_hora').val()
		}
		if (dato.idUser.length<0 || dato.Usuario.length==0 || dato.descripcion.length<1 || dato.Codigo.length==0 || dato.fecha_presentacion.length==0 || dato.hora.length==0){
			alert('Dejo Campos en blanco Verifique por favor...');
			return false;
		}
		else{
			$("#id_descripcion").val("");$("#id_Codigo").val("");$("#id_fecha_presentacion").val("");
			$("#id_hora").val(" ");
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
				    socket.emit('coordenadasDatos', coordenadas)
				     //alert("Lat="+latitud+" - Long="+longitud+" - Precision="+precision);
				     alert("Notificacion enviada exitosamente");
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
		socket.emit('notificacion', dato);
		cont=cont+1;
		socket.emit('notificaciones',cont);
		}
	}
	socket.on('devolviendo', function(data){
	var data = JSON.parse(data);
	//console.log(data);
$("#comentario").prepend("<li>"+data.Usuario+ ":Notifico.-" +data.descripcion+"   Cod:  "+data.Codigo+"</li>");
$("#cuenta").html('Notificaciones registradas:'+data.cont+"<a href='/TodaslasNotificaciones/'>   Ver Todos</a>");
		var playing = true;
        $(this).toggleClass("down");
        if (playing == true) {
            //document.getElementById('player').play();
        }
	}); 
	socket.on('regresandoCooords',DatosCoors);
	function DatosCoors(Coords){
		iniciar(Coords);
	}
	function iniciar(Coords) {
		console.log(Coords.lat);
		console.log(Coords.lng);
		var mapOptions = {
			center: new google.maps.LatLng(Coords.lat, Coords.lng),
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);
		var pos = new google.maps.LatLng(Coords.lat, Coords.lng);
		marker = new google.maps.Marker({
            position: pos,
            map: map, 
            title:"Ubicacion",
            animation: google.maps.Animation.DROP
        });
	} 
	/*socket.on('Avisos',Respuesta);
		function Respuesta(data){
			alert('Notificacion: '+data);
		}*/
function ventanaSecundaria(URL){
    window.open(URL,"Editar","width=500,height=300,scrollbars=NO top=150 left=550");
}