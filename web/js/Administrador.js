let onReady = () => {


  /*  let cargaModal = (evt) => {
        let id;
        if (!evt.target.getAttribute("value")) {
            id = evt.target.parentElement.getAttribute("value");
        } else {
            id = evt.target.getAttribute("value");
        }


        console.log(id);
    }


   */

    $("#buscadorDocente").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#tablaDocentesGenerales tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)

            /*
             if( $(this).toggle($(this).text().toLowerCase().indexOf(value)==0)){


                 let areaListado = document.querySelector("#areaListado");

                 let alerta = document.createElement("div");
                 alerta.className = "alert alert-warning";
                 alerta.setAttribute("role","alert");
                 let mensajeAlerta = document.createTextNode("No hay registros del docente aquí");
                 alerta.appendChild(mensajeAlerta);
                 areaListado.appendChild(alerta);
             }


             */
        });
    });


    $("#estadistica").click((evt) => {
        $("#nav input").val("Estadistica");
        $("#nav").attr("action", "AdministradorServlet");
        $("#nav").attr("method", "POST");
        $("#nav").submit();
    });

    $("#docente").click((evt) => {
        $("#nav input").val("ListarDocentes");
        $("#nav").attr("action", "AdministradorServlet");
        $("#nav").attr("method", "POST");
        $("#nav").submit();
    });

    $("#docentesGenerales").click((evt) => {
        $("#nav input").val("DocentesGenerales");
        $("#nav").attr("action", "AdministradorServlet");
        $("#nav").attr("method", "POST");
        $("#nav").submit();
    });


// sidebar toggle
    const btnToggle = document.querySelector('#sidebarCollapse');

    btnToggle.addEventListener('click', function () {

        document.getElementById('sidebar').classList.toggle('active');

        document.getElementById('content').classList.toggle('active');
    });



    $("body").on("click",".btnAsignar",function () {
            let idDocente = this.getAttribute("data-id");


           let id=  document.querySelector("#idDocente").value = idDocente;
           console.log(id);

    });

       $("body").on("click", ".btn-success", function () {
           let formulario = document.querySelector("#formHorario");
           let datos = new FormData(formulario);
           datos.append("accion", "asignarHorario");
           // llamada asincrona para mandar los datos al servlet

           $.ajax({
               url: "AdministradorServlet",
               method: "POST",
               processData: false,
               contentType: false,
               data: datos
           }).done((response) => {
               if (response == "true") {

                   const Toast = Swal.mixin({
                       toast: true,
                       position: 'top-end',
                       showConfirmButton: false,
                       timer: 3000
                   });

                   Toast.fire({
                       type: 'success',
                       title: 'Horario asignado correctamente.'
                   });

                   formulario.reset();
                   $("#dia").focus();


               } else {

                   const Toast = Swal.mixin({
                       toast: true,
                       position: 'top-end',
                       showConfirmButton: false,
                       timer: 3000
                   });

                   Toast.fire({
                       type: 'error',
                       background: "#FADBD8",
                       title: 'El horario no se logró establecer, por alguna razón.'
                   });
               }
           }).fail(() => {

               const Toast = Swal.mixin({
                   toast: true,
                   position: 'top-end',
                   showConfirmButton: false,
                   timer: 3000
               });

               Toast.fire({
                   type: 'error',
                   background: "#FADBD8",
                   title: 'No pudo ser procesada tu solicitud.'
               });

           });


       });






}
document.addEventListener("DOMContentLoaded", onReady);
