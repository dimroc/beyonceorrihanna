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