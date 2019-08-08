let onReadyAdminProfile =()=> {

    $("#estadistica").click((evt)=>{
        $("#nav input").val("Estadistica");
        $("#nav").attr("action", "AdministradorServlet");
        $("#nav").attr("method", "POST");
        $("#nav").submit();
    });

    $("#docente").click((evt)=>{
        $("#nav input").val("ListarDocentes");
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



//hace mayusculas
    function myFunction(obj) {
        obj.value = obj.value.toUpperCase();
    }



}


addEventListener("DOMContentLoaded",onReadyAdminProfile);