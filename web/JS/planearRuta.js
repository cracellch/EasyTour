var pr = 8;

function forularioruta(e){   
   var x = document.getElementById("nom_lug_1").innerText;
   var z = document.getElementById("nom_lug_2").innerText;
   var y = document.getElementById("nom_lug_3").innerText;
   var w = document.getElementById("nom_lug_4").innerText;
   var r = document.getElementById("nom_lug_5").innerText;
   var t = document.getElementById("nom_lug_6").innerText;  

   var tourjson = {"Lugar1" : x,
                         "Lugar2" : z,"Lugar3" : y,"Lugar4" : w,"Lugar5" : r,"Lugar6" : t}; 
  var todo = tourjson.Lugar1+"-"+ tourjson.Lugar2+"-"+ tourjson.Lugar3+"-"+ tourjson.Lugar4+"-"+ tourjson.Lugar5+"-"+ tourjson.Lugar6+"?" ;
 todo = todo.replace("-----?","");
 todo = todo.replace("----",",");
 todo = todo.replace("----",",");
 todo = todo.replace("---",",");
 todo = todo.replace("--",",");
 todo = todo.replace("----?","");
 todo = todo.replace("---",",");
 todo = todo.replace("--",",");
 todo = todo.replace("-",",");
 todo = todo.replace("---?","");
  todo = todo.replace("--",",");
 todo = todo.replace("-",",");
 todo = todo.replace("--?","");
  todo = todo.replace("-",",");
 todo = todo.replace("-?","");
 todo = todo.replace("?","");
   document.getElementById("ruta").value = todo; 
   alert(todo)
  var f = document.getElementById("ruta").value; 
   var x = parseInt(document.getElementById("durLuga_1").innerText);
   var z = parseInt(document.getElementById("durLuga_2").innerText);
   var y = parseInt(document.getElementById("durLuga_3").innerText);
   var w = parseInt(document.getElementById("durLuga_4").innerText);
   var d = x+z+y+w; 
   document.getElementById("tiempo").value = d;
  var nada ="";
    if((f.localeCompare(nada)) !== 0 ){ 
     document.formularioruta.submit();
 }else{
   alert("Porfavor selecciona almenos un lugar para visitar.")   
}
  
}

function eliminardiv(i){
    document.getElementById("lugares_"+i).style.display = 'none';
    alert(document.getElementById("lugares_4").id);
    pr = 1;
}
   
function prueba(){
    alert(pr);
}

