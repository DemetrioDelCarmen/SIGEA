let onReady=()=>{

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



}

addEventListener("DOMContentLoaded",onReady);