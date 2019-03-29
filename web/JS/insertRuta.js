$("document").ready(function (){
    $("#butVG").click(function (){
        var date= $("#fecha").val();
        if (date != null && date != '') {
             $.post("buscarguia.jsp",
                {
                   date: date,
                   city: "Duckburg"
                },
             function(data,status){
                alert("Data: " + data + "\nStatus: " + status);
             });
        }
    });
});