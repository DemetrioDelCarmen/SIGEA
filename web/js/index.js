let onReady =()=> {
// sidebar toggle
    const btnToggle = document.querySelector('#sidebarCollapse');

    btnToggle.addEventListener('click', function () {

        document.getElementById('sidebar').classList.toggle('active');

        document.getElementById('content').classList.toggle('active');
    });



//hace mayusculas
    function myFunction(obj) {
        obj.value = obj.value.toUpperCase();
    }


//agregaparticipantes al modal de estudiante
    let agrega = () => {
        //1. Recuperar los valores de los controlas y
        //almacenarlos en variables
        let participante = document.querySelector("#participante").value;

        if (participante != "") {
            //2. mandarrlos a la tabla
            //2.1 Crear la fila
            let fila = document.createElement("tr");
            //2.2 Crear las columnas
            let columna1 = document.createElement("td");
            let columna2 = document.createElement("td");
            //crea los elementos
            let nuevoparticipante = document.createElement("input");
            nuevoparticipante.type = "text";
            nuevoparticipante.setAttribute("value", participante);
            nuevoparticipante.setAttribute("id", "nuevoparticipante");
            nuevoparticipante.className = "form-control my-1";

            let eliminar = document.createElement("input");
            eliminar.type = "button";
            eliminar.className = "btn btn-danger m-1 borrar";
            eliminar.setAttribute("id", "eliminar");
            eliminar.setAttribute("value", " x ");

            //2.3 Asignar la fila a la tabla
            columna1.appendChild(nuevoparticipante);
            columna2.appendChild(eliminar);


            fila.appendChild(columna1);
            fila.appendChild(columna2);

            //2.4 Agregar la fila a la tabla
            document.querySelector("#tablaestudianteasesoria").appendChild(fila);
            document.querySelector("#participante").value = "";

        } else {
            swal({
                type: 'error',
                title: 'Oops...',
                text: 'Debes ingresar la matricula del alumno',
            })
        }
    }
    /*  document.querySelector("#agregar")
        .addEventListener("click",agrega);


     */

//borra filas de la tabla de participantes
    $(document).on('click', '.borrar', function (event) {
        event.preventDefault();
        $(this).closest('tr').remove();

    });

//valida la asesoria

    let validaAsesoria = () => {
        if (!document.getElementById('nuevoparticipante')) {
            swal({
                type: 'error',
                title: 'ERROR',
                text: 'Revisa que los campos esten completos',
            })
        } else {
            let participante = document.querySelector("#nuevoparticipante").value;
            let docente = document.querySelector("#docente").value;
            let horario = document.querySelector("#horario").value;

            if (participante != '' && docente >= 1 && horario >= 1) {
                swal({
                    type: 'success',
                    title: 'HECHO',
                    text: 'Asesoria registrada exitosamente',
                })
                document.querySelector("form").reset();
                document.getElementById('myModal').reset();

                /*  document.querySelector("registrar").setAttribute('data-dismiss','modal'); */

            } else {
                swal({
                    type: 'error',
                    title: 'ERROR',
                    text: 'Revisa que los campos esten completos',
                })
            }
        }

    }
    document.querySelector("#registrar")
        .addEventListener("click", validaAsesoria);

}


addEventListener("DOMContentLoaded",onReady);