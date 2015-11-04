$(".nn li a").on("click",function(e){
		e.preventDefault()
		var urla=$(this).attr("href");  
		console.log(urla);
		cargarFormularios(urla)
		$(".infoo").dialog({
			modal:true,
			show:"blind",
			width: 600,
			hide:"explode",
			title:"Detalles del Negocio.",
			position: "center"
		});	
	});
cargarFormularios=function(urla){
				$.ajax({
						url: urla,
						type: 'GET',
						data: {}
					})
					.done(function(response) {
						$(".infoo").html(response);
					})
					.fail(function() {
						console.log("error");
					})
					.always(function() {
						console.log("complete");
					});
			}