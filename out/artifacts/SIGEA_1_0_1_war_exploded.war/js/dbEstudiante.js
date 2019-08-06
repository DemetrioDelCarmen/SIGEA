let onReady =()=>{

    let cargaModal = (evt) => {
        let id;
        if(!evt.target.getAttribute("value")){
            id = evt.target.parentElement.getAttribute("value");
        }else{
            id = evt.target.getAttribute("value");
        }

        console.log(id);
    }

    let etiquetas = document.getElementsByClassName("materiaasesoria");
    for (let i = 0; i < etiquetas.length; i++) {
        let id = etiquetas[i].getAttribute("value");
        etiquetas[i].addEventListener("click", cargaModal);
    }




}

document.addEventListener("DOMContentLoaded",onReady);