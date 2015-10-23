$(".nn li a").on("click",function(e){
		e.preventDefault()
		var urla=$(this).attr("href");
		console.log(urla);
		cargarFormularios(urla)
		$(".info").dialog({
			modal:true,
			show:"blind",
			width: 600,
			hide:"explode",
			title:"Detalles del Negocio.",
			position: "center"
		});	
	});
cargarFormularios=function(url){
				$.ajax({
						url: url,
						type: 'GET',
						data: {},
					})
					.done(function(response) {
						$(".info").html(response);
					})
					.fail(function() {
						console.log("error");
					})
					.always(function() {
						console.log("complete");
					});
			}