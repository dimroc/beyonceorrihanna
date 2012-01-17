class Beyonceorrihanna.CharactersController extends Batman.Controller
  messageSendSuccess: null
  searchQueryError: false

  characters: null

  @set_voted = (rivalry_character_id) ->
    $("section.character##{rivalry_character_id} form button")
    .data('enabled', false)

    $("section.character##{rivalry_character_id}")
    .addClass("voted");

    $("section.character form button")
    .addClass('disabled')

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

    $.ajax(
      type: 'POST'
      url: url)
    .done ->
      Beyonceorrihanna.CharactersController.set_voted(rivalry_character_id)
      character = Beyonceorrihanna.Character.find rivalry_character_id, (err) -> throw err if err
      character.set 'votes_count', character.get('votes_count') + 1

    @render false