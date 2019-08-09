let onReadyStudentProfile = () => {

    let cargaModal = (evt) => {
        let id;
        if (!evt.target.getAttribute("value")) {
            id = evt.target.parentElement.getAttribute("value");
        } else {
            id = evt.target.getAttribute("value");
        }


        console.log(id);

        $.ajax({
            url: "EstudianteServlet",
            method: "POST",
            data: {
                idMateria: id,
                accion: "cargarMateria"
            }
        }).done((response) => {

            while (docente = document.querySelector("#docentes").lastChild) {
                document.querySelector("#docentes").removeChild(docente);
            }

            console.log(response);
            let materia = JSON.parse(response);



            console.log(materia);

              let texto = document.createTextNode("Selecciona a un docente");
              let opcion = document.createElement("option");
              opcion.value = 0;
              opcion.appendChild(texto);

              document.querySelector("#docentes").appendChild(opcion);


            $(".modal-title").html("");


            for (let i in materia) {

                $(".modal-title").html(materia[i].nombreMat);




                //  document.getElementsByClassName("modal-title").innerHTML = materia[i].nombreMat;
                let nombreDocente =
                    document.createTextNode(materia[i].nombreDocente + " " +
                        materia[i].primerApellidoDocente + " " + materia[i].segundoApellidoDocente);
                let opcion = document.createElement("option");
                opcion.value = materia[i].idDocente;
                opcion.appendChild(nombreDocente);

                document.querySelector("#docentes").appendChild(opcion);

            }


        }).fail(() => {
            alert("No se pudo procesar la peticion");
        });

        // aqui se hace la peticion de docentes por el id de la materia que selecciona

        /* let datos = {
             idMat: id,
             load: "loadDocByMat"
         };

         fetch("MateriaServlet", {
             method: "POST",
             body: JSON.stringify(datos)
         })
             .then(function (response) {
             return response.json();

         })
             .then(function (json) {
             json.forEach((element) => {
                 let nombreDocente =
                     document.createTextNode(element.nombreDocente + " " +
                         element.primerApellidoDocente + " " + segundoApellidoDocente);
                 let opcion = document.createElement("option");
                 opcion.value = element.idDocente;
                 opcion.appendChild(nombreDocente);

                 document.querySelector("#docentes").appendChild(opcion);
             });

         });


         */

    }

    let cargarDiasDocente = () => {
        let idDocente = document.querySelector("#docentes").value;

        $.ajax({
            url: "DiasServlet",
            method: "POST",
            data: {
                idDocente: idDocente,
                accion: "loadDaysDoc"
            }
        }).done((response) => {
            console.log(response);
            let dias = JSON.parse(response);


            while (dia = document.querySelector("#dia").lastChild) {
                document.querySelector("#dia").removeChild(dia);
            }


            let texto = document.createTextNode("Selecciona un día");
            let opcion = document.createElement("option");
            opcion.value = 0;
            opcion.appendChild(texto);

            document.querySelector("#dia").appendChild(opcion);


            for (let i in dias) {

                let nombreDia = document.createTextNode(dias[i].dia_dia);
                let opcion = document.createElement("option");
                opcion.value = dias[i].id_dia;

                opcion.appendChild(nombreDia);

                document.querySelector("#dia").appendChild(opcion);

            }

        }).fail(() => {
            alert("No se pudieron traer los días");
        })
    }


    let etiquetas = document.getElementsByClassName("materiaasesoria");
    for (let i = 0; i < etiquetas.length; i++) {
        let id = etiquetas[i].getAttribute("value");


        etiquetas[i].addEventListener("click", cargaModal);
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
    document.querySelector("#docentes").addEventListener("change", cargarDiasDocente);

}

document.addEventListener("DOMContentLoaded", onReadyStudentProfile);