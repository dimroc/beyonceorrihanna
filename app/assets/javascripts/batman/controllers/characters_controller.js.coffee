class Beyonceorrihanna.CharactersController extends Batman.Controller
  messageSendSuccess: null
  searchQueryError: false

  characters: null

  index: ->
    Beyonceorrihanna.Character.load (err) -> throw err if err
    @set 'characters', Beyonceorrihanna.Character.get('all')

  show: (params) ->
    character = Beyonceorrihanna.Character.find params.id, (err) ->
      throw err if err

    @set 'character', character

  vote: (form) ->
    rivalry_character_id = $(form).data("rivalry_character_id")
    return unless rivalry_character_id
    url = "/votes?rivalry_character_id=#{rivalry_character_id}"
    console.debug "attempting to vote to #{url}"

    $.ajax(
      type: 'POST'
      url: url)
    .done ->
      console.debug "COMPLETED VOTE!"
      $("section.character##{rivalry_character_id} form button")
      .data('enabled', false)
      .text('Voted')
      .addClass('disabled')

      $("section.character##{rivalry_character_id}")
      .addClass("voted");

    @render false


