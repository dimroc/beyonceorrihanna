$(function() {
  $(".prompt-user").click(function(){
    if(!confirm("Are you sure?"))
    {
      event.preventDefault();
    }
  });
});