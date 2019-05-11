//Inicia el frame
(function($){
  $(function(){

    $('.sidenav').sidenav();
    $('.parallax').parallax();
    $('.tabs').tabs();
    $(".dropdown-trigger").dropdown({
      coverTrigger: false,
      constrainWidth: false
    });
  }); // end of document ready
})(jQuery); // end of jQuery name space

var ids = [];


function addPlace(name, imag, num, time){
    var nn= "'"+name+"'";
    //Lo añade al recuadro de la derecha
    var li = document.createElement("LI");
    li.setAttribute("class","collection-item avatar");
    li.setAttribute("id","outli"+num);
    var img = document.createElement("img");
    img.setAttribute("src",imag);
    img.setAttribute("class","circle");
    var span = document.createElement("h6");
    //span.setAttribute("class","title");
    var textnode = document.createTextNode(name);
    span.appendChild(textnode);
    var a = document.createElement("a");
    a.setAttribute("class","secondary-content");
    var i = document.createElement("i");
    i.setAttribute("class","material-icons");
    i.setAttribute("id","iccoll");
    i.setAttribute("onclick",'quitar('+num+')');
    var textnode1 = document.createTextNode("clear");
    i.appendChild(textnode1);
    li.appendChild(img);
    a.appendChild(i);
    li.appendChild(span);
    li.appendChild(a);

    document.getElementById("collection").appendChild(li);
    document.getElementById("Lcard"+num).style.backgroundColor = '#b2ff59';
    document.getElementById("tabQui"+num).style.display='none';
    ids.push(num);
    //$("collection").append('<li class="collection-item avatar" id="outli'+num+'"><img src="'+img+'" alt="" class="circle"><span class="title">'+name+'</span><a class="secondary-content" onclick="quitar('+num+','+time+','+nn+')"><i class="material-icons" id="iccoll">clear</i></a></li>');

    //tiempo = tiempo + Integer.parse;
    //document.getElementById("tiempo").value= tiempo;
}

function quitar(num){
    document.getElementById('outli'+num).style.display = "none";
    document.getElementById("tabQui"+num).style.display='block';
    document.getElementById("Lcard"+num).style.backgroundColor = 'white';
    
    for (var i = 0; i < ids.length; i++) {
        if (ids[i] == num) {
           ids.splice(i,1);
           alert("out id");
           break;
        }
    }
    
}

function delPlace(i){
    document.getElementById("li"+i).style.display = 'none';
 }

function mandar(event){
        if (ids.length < 1) {
            alert("Elige tu ruta antes de continuar");
        } else {
            var datos = ids.join(":");
            alert(datos);
            $.post("asigValRuta.jsp",
                    {
                        ruta: datos
                    },
                    function (data, status) {
                        alert(data);
                        if(valData(data)){
                            location.replace("insertRuta.jsp");
                        }
                        
                    });
       }
}

function valData(data){
    var reg = /Todo\sbien/;
    if (reg.test(data)) {
        return true;
    }
    else{
        alert("Ha ocurrido un error. \n Inténtalo de nuevo.");
    }
}