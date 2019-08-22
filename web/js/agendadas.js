let onReady =()=>{


    $("#asesorias").click((evt) => {
        $("#nav input").val("Asesorias");
        $("#nav").attr("action", "EstudianteServlet");
        $("#nav").attr("method", "POST");
        $("#nav").submit();
    });

    $("#agendadas").click((evt) => {
        $("#nav input").val("Agendadas");
        $("#nav").attr("action", "EstudianteServlet");
        $("#nav").attr("method", "POST");
        $("#nav").submit();
    });

    $("#concluidas").click((evt) => {
        $("#nav input").val("Concluidas");
        $("#nav").attr("action", "EstudianteServlet");
        $("#nav").attr("method", "POST");
        $("#nav").submit();
    });


    $("#irAgendar").click(()=>{
        $("#nav2 input").val("Asesorias");
        $("#nav2").attr("action","EstudianteServlet");
        $("#nav2").attr("method","POST");
        $("#nav2").submit();
    })

    const btnToggle = document.querySelector('#sidebarCollapse');

    btnToggle.addEventListener('click', function () {

        document.getElementById('sidebar').classList.toggle('active');

        document.getElementById('content').classList.toggle('active');
    });


    let areaListado = document.querySelector("#areaListado");

    let alerta = document.createElement("div");
    alerta.className = "alert alert-warning";
    alerta.setAttribute("role","alert");
    let mensajeAlerta = document.createTextNode("No hay registros del docente aquí");
    alerta.appendChild(mensajeAlerta);


    let cancelarAsesoria =()=>{

        let alerta = document.createElement("div");
        alerta.className = "alert alert-warning";
        alerta.setAttribute("role","alert");
        let mensajeAlerta = document.createTextNode("No hay registros del docente aquí");
        alerta.appendChild(mensajeAlerta);

        Swal.fire({
            title: '¿De verdad quieres cancelar esta asesoría?',
            text: alerta,
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.value) {
                Swal.fire(
                    'Asesoria cancelada!',
                    'Ya no eres parte de esta asesoría',
                    'success'
                )
            }
        })


    }


    function cancelar(dataid) {


        $.ajax({
            url: "EstudianteServlet",
            method: "POST",
            processData: false,
            contentType:false,
            data:{
                accion: "CancelarAsesoria",
                idEstudiante: dataid
            }
        }).done((response)=>{

        })
    }


}

addEventListener("DOMContentLoaded",onReady);