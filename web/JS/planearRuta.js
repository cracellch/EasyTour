var pr = [];
var tiempo = 0;
function aggPlace(i){
    document.getElementById("eb"+i).style.display = 'none';
    pr.push(i);
    document.getElementById("go"+i).disabled;
    //tiempo = tiempo + Integer.parse;
    //document.getElementById("tiempo").value= tiempo;
}

function eliminardiv(i){
    document.getElementById("lugares_"+i).style.display = 'none';
 }
   
function mandar(){
        document.getElementById("ruta").value=pr.join(",");
        alert(pr.join(","));
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

