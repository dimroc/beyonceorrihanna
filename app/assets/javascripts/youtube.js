$(function() {
  $(".ytapiplayer").each(function(index, ytplayer) {
    ytplayer = $(ytplayer);
    var url = ytplayer.data('youtube_url');
    var id = ytplayer.attr('id');
    swfobject.embedSWF(url, id, "398", "224", "8", null, null);
  });
});
