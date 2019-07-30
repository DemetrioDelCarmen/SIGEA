let onReady=()=>{

    document.querySelector("#errorID").style.display = 'none';

    let mensajeError = document.querySelector("#mensajeError").innerHTML;
    if(mensajeError!=""){
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 1500
        });

        Toast.fire({
            type: 'error',
            background: "#FADBD8",
            title: mensajeError
        })
    }





}

addEventListener("DOMContentLoaded", onReady);