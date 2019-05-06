/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
