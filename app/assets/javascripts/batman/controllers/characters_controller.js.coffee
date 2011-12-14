class Beyonceorrihanna.CharactersController extends Batman.Controller
  messageSendSuccess: null
  searchQueryError: false

  characters: null

  index: ->
    Beyonceorrihanna.Character.load (err) -> throw err if err
    @set 'characters', Beyonceorrihanna.Character.get('all')