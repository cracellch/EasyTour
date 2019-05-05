(function($){
  $(function(){

    $('.sidenav').sidenav();
    $('.collapsible').collapsible();
    $(".dropdown-trigger").dropdown({
      coverTrigger: false,
      constrainWidth: false
    });
  }); // end of document ready
})(jQuery); // end of jQuery name space

var preloaderCircular = '<div class="preloader-wrapper small active"><div class="spinner-layer spinner-green-only"><div class="circle-clipper left"<div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div></div>';

// var preloaderCircular tabulada
// <div class="preloader-wrapper small active"><div class="spinner-layer spinner-green-only">
//       <div class="circle-clipper left">
//         <div class="circle"></div>
//       </div><div class="gap-patch">
//         <div class="circle"></div>
//       </div><div class="circle-clipper right">
//         <div class="circle"></div>
//       </div>
//     </div>
//   </div>

    function prueba(txt){
      var reg= /tour\sconfirmado/;
      return reg.test(txt);
    }

function confirmar(x,id){
      var l= x.parentNode;
      l.innerHTML=preloaderCircular;

      var xhr = new XMLHttpRequest();
         xhr.open("POST", "confirmar.jsp", true);
         xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
         xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                if (prueba(this.responseText)) {
                  l.innerHTML='<a class="btn-small light-green accent-4 white-text"><i class="material-icons left">check</i>Confirmado</a>';
                } else {
                  alert("Ha ocurrido un error, por favor intenta de nuevo");
                  l.innerHTML= '<a class="waves-effect waves-light btn-small" onclick="confirmar(this, '+id+')">confirmar</a>';
                }
            }
             else{
               alert("Ha ocurrido un error, por favor intenta de nuevo");
               l.innerHTML= '<a class="waves-effect waves-light btn-small" onclick="confirmar(this, '+id+')">confirmar</a>';
            }
         }
         xhr.send("idt="+id);
}