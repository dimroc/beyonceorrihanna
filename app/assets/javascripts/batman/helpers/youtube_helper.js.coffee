Batman.mixins.youtube =
  initialize: ->
    $this = jQuery(this)
    setTimeout ->
      data = $this.data()
      id = $this.attr('id')
      swfobject.embedSWF(data.youtube_url, id, "398", "224", "8", null, null)
    , 1000