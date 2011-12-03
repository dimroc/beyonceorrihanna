$(function() {
  $("body.rivalries.show section.rivalry_character form.button_to").bind("ajax:success", function(event, data) {
    console.debug(data);
    $("body.rivalries.show section.rivalry_character input[type=submit]").attr('disabled', true);
  });
});