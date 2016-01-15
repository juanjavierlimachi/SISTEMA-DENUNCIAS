$(document).keypress(function(e) { 
        if(e.which == 13) { 
            dato=$('#id_texto').val();
           // alert(dato);
           if (isNaN(dato) || $('#id_texto').val().length==''){
                alert('Ingrese un Codigo de tipo Numerico');
                return false;
           }
           
        } 
    });