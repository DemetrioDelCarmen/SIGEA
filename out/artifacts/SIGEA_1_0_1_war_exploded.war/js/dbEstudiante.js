let onReadyStudentProfile = () => {

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


    $("#agendarasesoria").click(()=>{
        $("#nav2 input").val("Asesorias");
        $("#nav2").attr("action","EstudianteServlet");
        $("#nav2").attr("method","POST");
        $("#nav2").submit();
    })


// sidebar toggle
    const btnToggle = document.querySelector('#sidebarCollapse');

    btnToggle.addEventListener('click', function () {

        document.getElementById('sidebar').classList.toggle('active');

        document.getElementById('content').classList.toggle('active');
    });


    let cargaModal = (evt) => {


        while (dia = document.querySelector("#dia").lastChild) {
            document.querySelector("#dia").removeChild(dia);
        }

        let id;

        if (!evt.target.getAttribute("value")) {
            id = evt.target.parentElement.getAttribute("value");
        } else {
            id = evt.target.getAttribute("value");


        }



        console.log(id);
        document.querySelector("#idMateria").value = id;
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

        // FETCH aqui se hace la peticion de docentes por el id de la materia que selecciona

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

    let cargarHorarios = () => {

        let idDocente = document.querySelector("#docentes").value;
        $.ajax({
            url: "HoficialServlet",
            method: "POST",
            data: {
                idDocente: idDocente,
                accion: "obtenerHorario"
            }
        }).done((response) => {
            let horario = JSON.parse(response);
            console.log(horario);



            let texto = document.createTextNode("Selecciona cuándo");
            let opcion = document.createElement("option");
            opcion.appendChild(texto);
            opcion.value = 0;
            document.querySelector("#dia").appendChild(opcion);


            for (let i in horario) {
                let textoHorario = document.createTextNode(horario[i].horaAsesoria);
                let opcion = document.createElement("option");
                opcion.value = horario[i].idHorario;
                opcion.appendChild(textoHorario);
                document.querySelector("#dia").appendChild(opcion);


            }

        })

    }

    let resetearFormulario =()=>{
        let formulario =  document.querySelector("#formularioAsesoria");


        formulario.reset();

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


    let cargarHoraDia = () => {
        let idDocente = document.querySelector("#docentes").value;
        $.ajax({
            url: "HoficialServlet",
            method: "POST",
            data: {
                accion: "obtenerHorario",
                idDocente: idDocente,
            }
        }).done((response) => {
            console.log(response);

            let horas = JSON.parse(response);

            while (hora = document.querySelector("#horario").lastChild) {
                document.querySelector("#horario").removeChild(hora);
            }

            let opcion = document.createElement("option");
            opcion.value = 0;
            let texto = document.createTextNode("Selecciona una hora");

            opcion.appendChild(texto);

            document.querySelector("#horario").appendChild(opcion);

            for (let i in horas) {

                let textoHora = document.createTextNode(horas[i].horaAsesoria);
                let opcion = document.createElement("option");
                opcion.appendChild(textoHora);
                opcion.value = horas[i].idHorario;

                document.querySelector("#horario").appendChild(opcion);


            }


        })


    }


    let etiquetas = document.getElementsByClassName("materiaasesoria");
    for (let i = 0; i < etiquetas.length; i++) {
        let id = etiquetas[i].getAttribute("value");


        etiquetas[i].addEventListener("click", cargaModal);
    }


//agregaparticipantes al modal de estudiante
    let agrega = () => {
        //1. Recuperar los valores de los controles y
        //almacenarlos en variables
        let participante = document.querySelector("#participante").value;


        if (participante != "") {
            $.ajax({
                url: "EstudianteServlet",
                method: "POST",
                data: {
                    matricula: participante,
                    accion: "recuperarEstudiante",
                }

            }).done((response) => {

                let estudiante = JSON.parse(response);

                if (estudiante.idEstudiante == 0) {


                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 1500
                    });

                    Toast.fire({
                        type: 'error',
                        background: "#FADBD8",
                        title: "Matrícula no válida"
                    })

                } else {
                    let areaNombre = document.querySelector("#participantes");

                    let nombreEstudiante = document.createTextNode(estudiante.nombre);
                    let opcion = document.createElement("option");
                    opcion.value = estudiante.idEstudiante;
                    opcion.appendChild(nombreEstudiante);
                    areaNombre.appendChild(opcion);

                    document.querySelector("#participante").value = "";

                }
            })
        } else {
            swal({
                type: 'error',
                title: 'Oops...',
                text: 'Debes ingresar la matricula del alumno',
            })
        }
    }

    //borra filas de la tabla de participantes
    $(document).on('click', '.borrar', function (event) {
        event.preventDefault();
        $(this).closest('tr').remove();

    });

//valida la asesoria


    let registrarAsesoria = () => {

        let formulario = document.querySelector("#formularioAsesoria");

        let datos = new FormData(formulario);
        datos.append("accion", "registrarAsesoria");


        $.ajax({

            url: "EstudianteServlet",
            method: "POST",
            data: datos,
            processData: false,
            contentType: false

        }).done((response) => {
            console.log(response);

            if(response=="true"){
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000
                });

                Toast.fire({
                    type: 'success',
                    title: 'Asesoria registrada correctamente.'
                });

                formulario.reset();
            }else{
                alert("No se pudo registrar");
            }
        })

    }


    document.querySelector("#docentes")
        .addEventListener("change", cargarHorarios);
    document.querySelector("#registrar")
        .addEventListener("click", registrarAsesoria);

    document.querySelector("#agregar")
        .addEventListener("click", agrega);
    document.querySelector("#cancelarRegistro")
        .addEventListener("click",resetearFormulario);

}

document.addEventListener("DOMContentLoaded", onReadyStudentProfile);