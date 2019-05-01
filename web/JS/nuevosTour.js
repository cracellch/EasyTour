(function($){
  $(function(){

    $('.sidenav').sidenav();
    $(".dropdown-trigger").dropdown({
      coverTrigger: false,
      constrainWidth: false
    });
  }); // end of document ready
})(jQuery); // end of jQuery name space


function sendDataC(event){

    var pas= document.getElementById("password").value;
    var cor= document.getElementById("email").value;
    var ccor= document.getElementById("cemail").value;

    if (validPass1(pas) && validCorreo(cor,ccor)) {
      var xhr = XMLHttpRequest();
         xhr.open("POST", "ModificarDatos.jsp", true);
         xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
         xhr.onreadystatechange = function(){
            document.getElementById("bp").style.display="none";
             if(xhr.readyState == 4 && xhr.status == 200){

                if (prueba(this.responseText)) {
                  document.getElementById("cpanel").style.backgroundColor="#64dd17";
                  document.getElementById("cptext").innerHTML=this.responseText;
                  document.getElementById("icono").innerHTML="check";
                } else {
                  document.getElementById("cpanel").style.backgroundColor="red";
                  document.getElementById("cptext").innerHTML=this.responseText;
                  document.getElementById("icono").innerHTML="clear";
                }
            }
             else{
               document.getElementById("cpanel").style.backgroundColor="red";
               document.getElementById("cptext").innerHTML="Ha ocurrido un error";
               document.getElementById("icono").innerHTML="close";
            }
         }
         xhr.send("ncorreo="+cor+"&pas="+pas);
    } else {
      document.getElementById("cpanel").style.backgroundColor="red";
      document.getElementById("cptext").innerHTML="Verifica que el correo sea igual y tenga un formato adecuado";
      document.getElementById("icono").innerHTML="close";
    }

}
//
// function sendDataP(event){
//         document.getElementById("cpanel").style.display="block";
//         var pas= document.getElementById("pass").value;
//         var npass= document.getElementById("npass").value;
//         var cpass= document.getElementById("cpass").value;
//
//         if (validPass2(pas, npass, cpass)) {
//           var xhr = XMLHttpRequest();
//              xhr.open("POST", "ModificarDatos.jsp", true);
//              xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
//              xhr.onreadystatechange = function(){
//                 document.getElementById("bp").style.display="none";
//                  if(xhr.readyState == 4 && xhr.status == 200){
//
//                     if (prueba(this.responseText)) {
//
//                       document.getElementById("cpanel").style.backgroundColor="#64dd17";
//                       document.getElementById("icono").innerHTML="check";
//                       document.getElementById("cptext").innerHTML=this.responseText;
//                     } else {
//
//                       document.getElementById("cpanel").style.backgroundColor="red";
//                       document.getElementById("icono").innerHTML="close";
//                       document.getElementById("cptext").innerHTML=this.responseText;
//                     }
//                 }
//                  else{
//                    document.getElementById("cpanel").style.backgroundColor="red";
//                    document.getElementById("icono").innerHTML="close";
//                    document.getElementById("cptext").innerHTML="Ha ocurrido un error";
//                 }
//              }
//              xhr.send("pas="+pas+"&npas="+npas);
//         }
//         else {
//
//           document.getElementById("cpanel").style.backgroundColor="red";
//           document.getElementById("icon").innerHTML="close";
//           document.getElementById("cptext").innerHTML="Verifica que las nuevas contraseñas sean iguales y que cumplan con el formato";
//         }
// }
//
//     function prueba(txt){
//       var reg= /Cambio\sguardado/;
//       return reg.test(txt);
//     }
//
//     function validCorreo(email, reemail){
//      var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
//        if (!re.test(email) || email!=reemail) {
//            return false
//        } else {
//            return true;
//        }
//     }
//
//     function validPass1(pass){
//         var reg= /^[\w+*&%$#¿?!¡]{8,16}$/;
//         if (!reg.test(pass)){
//             return false;
//         }
//         else{
//             return true;
//         }
//     }
//
//     function validPass2(pass, npass, cpass){
//         var reg= /^[\w+*&%$#¿?!¡]{8,16}$/;
//         if (!reg.test(pass) || npass!= cpass  || !reg.test(npass)){
//             return false;
//         }
//         else{
//             return true;
//         }
//     }
