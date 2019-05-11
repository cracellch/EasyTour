 //Regex para la información que se solicita
 function validCorreo(email, reemail){
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!re.test(email) || email!=reemail) {
        alert("Ingresa un correo válido");
        return false
    } else {
        
        return true;
    }

}
function validNom(string){
    var letters = /^([A-Za-zñÑÁÉÍÓÚñáéíóú]+\s{0,1}){1,2}$/;
	if(letters.test(string)){
		return true;
	}
	else {
		alert ("Ingresa un nombre válido");
		return false;
	}
     
}
function validCel(num){
    var reg= /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/;
    if(reg.test(num)){
		return true;
	}
	else {
		alert ("Ingresa un telefono válido");
		return false;
	}
    
    //Formatos válidos
//    (123) 456-7890
//    (123)456-7890
//    123-456-7890
//    123.456.7890
//    1234567890
//    +31636363634
//    075-63546725
}
function validCurp(curp){
    var reg = /^[A-Z]{1}[AEIOU]{1}[A-Z]{2}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[HM]{1}(AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)[B-DF-HJ-NP-TV-Z]{3}[0-9A-Z]{1}[0-9]{1}$/;
    if(reg.test(curp)){
		return true;
	}
	else {
		alert ("Ingresa un curp válido");
		return false;
	}

}

function validateRFC(rfc) {
    var reg= /^[a-zA-Z]{3,4}(\d{6})((\D|\d){3})?$/;
    if(reg.test(rfc)){
		return true;
	}
	else {
		alert ("Ingresa un RFC válido");
		return false;
	}

}

function validDir(dir){
    var reg = /^([A-Za-zñÑÁÉÍÓÚñáéíóú]+\s)+\d{1,4}[,]?\s([A-Za-zñÑÁÉÍÓÚñáéíóú]+\s?){1,3}$/;
    if(reg.test(dir)){
		return true;
	}
	else {
		alert ("Ingresa un telefono válido");
		return false;
	}
}

function validPass(pass, npass){
    var reg= /^[\w+*&%$#¿?!¡]{8,16}$/;
    if (!reg.test(pass) || npass!= pass){
       alert("Ingresa una contraseña de 8 a 16 caracteres.");
      return false;
    }
    else{
        alert("pass: true");
        return true;
    }
}

// AAPR630321HDFLRC09
// GEC8501014I5
//1234567890
//12345678
//1234567890
//Calle 98, Azcapo
//gerar@do.com
function sendDataG(event){
    //variables
    var nom= document.getElementById("Nombre").value;
    var apepa= document.getElementById("apePad").value;
    var apema= document.getElementById("apeMad").value;
    var curp = document.getElementById("curp").value;
    var rfc = document.getElementById("rfc").value;
    var tel = document.getElementById("tel").value;
    var dir = document.getElementById("dir").value;
    var pas= document.getElementById("contra").value;
    var npas= document.getElementById("valCon").value;
    var cor= document.getElementById("correo").value;
    var ncor= document.getElementById("valCor").value;
    //var a mandar por ajax
    var data;
    if (validNom(nom) && validNom(apepa) && validNom(apema) && validCurp(curp) && validateRFC(rfc) && validCel(tel) &&
            validDir(dir) && validPass(pas,npas) && validCorreo(cor,ncor)) {
            data= nom+";"+apepa+";"+apema+";"+curp+";"+rfc+";"+tel+";"+dir+";"+cor+";"+pas;
            //Petición ajax
            alert(data);
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "registros.jsp", true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    alert(this.responseText);
                    if (prueba(this.responseText)) {
                        alert("Guia registrado con éxito");
                        location.replace("index.jsp");
                    }
                    else {
                        alert(this.responseText);
                    }
                }
                else{
                    alert("Ha ocurrido un error");
                }
            }
            //Envía la info a la url de arriba
            xhr.send("info_Guia="+data);
    } else {
        alert("Asegurate de insertar correctamente los datos");
    }
}

function prueba(txt){
  var reg= /guia|turista\sregistrado/;
  return reg.test(txt);
}

function sendDataT(event){
    //Varibales
    var nom= document.getElementById("Nombre").value;
    var apepa= document.getElementById("apePad").value;
    var apema= document.getElementById("apeMad").value;
    var pas= document.getElementById("contra").value;
    var npas= document.getElementById("valCon").value;
    var cor= document.getElementById("correo").value;
    var ncor= document.getElementById("valCor").value;
    //var a envíar en la petición ajax
    var data;
    if (validNom(nom) && validNom(apepa) && validNom(apema) && validPass(pas,npas) && validCorreo(cor,ncor)) {
            data= nom+","+apepa+","+apema+","+cor+","+pas;
            //Petición
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "registros.jsp", true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){

                    if (prueba(this.responseText)) {
                        alert("Turista registrado con éxito");
                        location.replace("index.jsp");

                    }
                    else {
                        alert(this.responseText);
                    }
                }
                else{
                    alert("Ha ocurrido un error");
                }
            }
            //Le mandamos las variables a la url de arriba
            xhr.send("info_Turista="+data);
    } else {
        alert("Asegurate de insertar correctamente los datos");
    }
}
