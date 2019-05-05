//Inicia el frame
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
