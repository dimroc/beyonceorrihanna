$(function () {
  $("body.rivalries.show section.rivalry_character a.rivalry_character_vote").click(function () {
    url = "/votes?rivalry_character_id={0}";
    var $vote = $(this);
    $vote.addClass('disabled');
    var id = $vote.data('id');
    if ($vote.data('enabled') == true) {
      $.ajax({
        type: 'POST',
        url: url.replace('{0}', id)
      }).done(function () {
            $("body.rivalries.show section.rivalry_character a.rivalry_character_vote")
                .data('enabled', false)
                .text('Voted')
                .addClass('disabled');
            $("body.rivalries.show section.rivalry_character_" + id)
                .addClass("voted");
          });
    }

    event.preventDefault();
  });
});