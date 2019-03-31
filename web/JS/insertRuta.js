$("document").ready(function () {
    $("#butVG").click(function () {
        var date = $("#fecha").val();
        if (date != null && date != '') {
            $.post("buscarguia.jsp",
                    {
                        date: date
                    },
                    function (data, status) {
                        alert("Data: " + data + "\nStatus: " + status);
                        var array = data.split(",");
                        $("#nomguia").val(array[1]); 
                        $("#corguia").val(array[2]); 
                        $("#ag").val(array[0]);
                        $("#butVG").hide();
                        $("#butMF").show();
                    });
        }
    });
    $("#butMF").click(function (){
        var date = $("#fecha").val();
        var duracion = $("#tiempo").val();
        var costo = $("#costo").val();
        var ruts = $("#important").val();
        var guia = $("#ag").val();
        alert(date + duracion + costo + ruts + guia);
        if (date != null && date != '') {
            $.post("guardarTour.jsp",
                    {
                        date: date,
                        tiempo: duracion,
                        costo: costo,
                        important: ruts,
                        guia: guia
                    },
                    function (data, status) {
                        if(data == "Tour guardado con éxito"){
                            alert(data);
                        }
                        else {
                            alert(data);
                        }
                    });
        }
    });
});
