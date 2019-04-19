function sendData(event){
    var pas= document.getElementById("acpass").value;
    var npas= document.getElementById("npass").value;
    var cor= document.getElementById("corpass").value;
    var xhr = XMLHttpRequest();
       xhr.open("POST", "ModificarDatos.jsp", true);
       xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
       xhr.onreadystatechange = function(){
           if(xhr.readyState == 4 && xhr.status == 200){
               alert(this.responseText);
           }
           else{
               alert("Ha ocurrido un error");
           }
       }
       xhr.send("ncorreo="+cor+"&pas="+pas+"&npas="+npas);
}