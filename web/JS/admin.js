/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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


var sb='bloqueado';
var tb;
var sa='activo';
var preloaderCircular = '<div class="preloader-wrapper small active"><div class="spinner-layer spinner-green-only"><div class="circle-clipper left"<div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div></div>';
function cambStatusTur(x,id, status){
      var stUsu = '<a class="btn-small light-green accent-4 white-text">Activo</a>';
      var l= x.parentNode;
      var sttosend = status;
      if (sb != status) {
          status = "'"+sb+"'";
          stUsu = '<a class="btn-small red white-text" id="status">Bloqueado</a>';
          tb='<a class="btn-small" id="bttn" onclick="cambStatusTur(this,'+id+','+status+')">Activar</a>';
      }
      else{
          status = "'"+sa+"'";
          tb='<a class="btn-small" id="bttn" onclick="cambStatusTur(this,'+id+','+status+')">Bloquear</a>';
      }
      l.innerHTML=preloaderCircular;
      var xhr = new XMLHttpRequest();
         xhr.open("POST", "cambStatusUsu.jsp", true);
         xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
         xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                if (prueba(this.responseText)) {
                  document.getElementById("status"+id).innerHTML = stUsu;
                  l.innerHTML = tb;
                } else {
                  alert("Ha ocurrido un error");
                  location.replace("adminTuristas.jsp");
                }
            }
             
         }
         xhr.send("idu="+id+"&status="+sttosend+"&tpu=1");
}

function cambStatusGuia(x,id, status){
      var l= x.parentNode;
      var sttosend = status;
      var stUsu = '<a class="btn-small light-green accent-4 white-text">Activo</a>';
      if (sb != status) {
          status = "'"+sb+"'";
          stUsu = '<a class="btn-small red white-text" id="status">Bloqueado</a>';
          tb='<a class="btn-small" id="bttn" onclick="cambStatusGuia(this,'+id+','+status+')">Activar</a>';
      }
      else{
          status = "'"+sa+"'";
          tb='<a class="btn-small" id="bttn" onclick="cambStatusGuia(this,'+id+','+status+')">Bloquear</a>';
      }
      l.innerHTML=preloaderCircular;
      var xhr = new XMLHttpRequest();
         xhr.open("POST", "cambStatusUsu.jsp", true);
         xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
         xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                if (prueba(this.responseText)) {
                  document.getElementById("status"+id).innerHTML = stUsu;
                  l.innerHTML = tb;
                } else {
                  alert("Ha ocurrido un error");
                  location.replace("adminGuias.jsp");
                }
            }
         }
         xhr.send("idu="+id+"&status="+sttosend+"&tpu=2");
}

function prueba (txt){
    var reg = /cambio\srealizado/;
    return reg.test(txt);
}