$(document).ready(inicio)
/*$(document).ready(carrito)
function carrito(){
    $(".enlace" ).click(function( event ) {
        event.preventDefault();
        var direccion=$(this).attr("href");
        $.ajax({
            type:'GET',
            url:direccion,
            data: {},
            success: crearFormulario,
            error:errores
        });
    });
    //FUNCIONES PARA NUESTRO CARRITO
    //AQUI USAMOS AJAX  que tiene una funcion llamada load, LOAD ES UNA FUNCION DE TIPO AJAX PERO MAS SIMPLE
    //LO QUE HACE ES CARGAR UNA URL QUE LE ENVIAMOS COMO PARAMENTRO, HACEMOS ESTO EN CASO DE QUE SI EL USUARIO VA A OTRA PAGINA
    //SE CARGE AUTOMATICAMENTE NUESTRO CARRITO
    $('#carrito').load("/productos/mostrar/carrito/");
}*/
function crearFormulario(data){
    $("#formulario").html(data);
}
function inicio()
{
    var ttbuscar=$("#textoo").attr('autocomplete','off');
    //Luego usamos la funcion keypress que nos indicara si el usuario esta presionando alguna tecla
    //Si es asi se llamara a una funcion buscar
    ttbuscar.keypress(buscarUser);
}
function buscarUser(){ 
    //es una simple funcion ajax que es de tipo GET y apunta a una url buscar, le enviamos como datos
    //el formulario con el id fbuscar
    //y cuando se complete la funcion ajax llamara a una funcion resultado
    $.ajax({
        type:'GET',
        url:'/buscarUsuario/',
        data:$("#fbuscarUser").serialize(),
        success:resultado,
        error:errores
    });
}
function resultado(data){
    //Seleccionamos el div con la clase resultado y aplicamos un efecto llamso fadeIn, este efecto lo que hace
    //es deslizar el div hacia avajo y le enviamos un parametro slow para que la transiccion no sea rapida
    $(".resultados").fadeIn("slow");
    console.log(data);
    // finalmente recibimos el dato que nos evia la url buscar y la añadimos al div resultado
    $(".resultados").html(data);
}
function errores(){
    console.log('Error');
}