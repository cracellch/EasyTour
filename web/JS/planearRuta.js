var ids = [];
var tiempo = 0;
var names= [];
function aggPlace(i, time, name){
    document.getElementById("eb"+i).style.display = 'none';
    ids.push(i);
    names.push(name);
    tiempo = tiempo = tiempo + time;
    document.getElementById("go"+i).disabled;
    //tiempo = tiempo + Integer.parse;
    //document.getElementById("tiempo").value= tiempo;
}

function eliminardiv(i){
    document.getElementById("lugares_"+i).style.display = 'none';
 }
   
function mandar(){
        document.getElementById("rut").value=ids.join(",");
        document.getElementById("ruta").value=names.join(",");
        document.getElementById("tiempo").value= tiempo;
        document.formularioruta.submit();
       /*var xhr = XMLHttpRequest();
       xhr.open("POST", "insertRuta.jsp", true);
       xhr.setRequestHeader("Content-type", "application/json");
       xhr.send(JSON.stringify(pr));
       xhr.onreadystatechange = function(){
           if(xhr.readyState == 4 && xhr.status == 200){
               alert("hola");
           }
           else{
               alert("error");
           }
       }*/
}

