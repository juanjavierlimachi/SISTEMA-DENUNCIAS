$("#datos li a").on("click",function(e){
		e.preventDefault()
		var urla=$(this).attr("href");  
		console.log(urla);
		cargarFormularios(urla)
		$("#notiii").dialog({
			modal:true,
			show:"blind",
			width: 450,
			hide:"explode",
			title:"Detalles del Negocio.",
			position: "center"
		});	
	});
cargarFormularios=function(url){
				$.ajax({
						url: url,
						type: 'GET',
						data: {}
					})
					.done(function(response) {
						console.log(response);
						$("#notiii").html(response);
					})
					.fail(function() {
						console.log("error");
					})
					.always(function() {
						console.log("complete");
					});
			}