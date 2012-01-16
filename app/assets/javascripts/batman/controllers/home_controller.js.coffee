class Beyonceorrihanna.HomeController extends Batman.Controller
  index: ->
    characters = Beyonceorrihanna.Character.get('all').indexedBy('rivalry_id').get(1)

    setTimeout( ->
      characters.toArray().forEach((character) ->
        if character.get 'voted?'
          Beyonceorrihanna.CharactersController.set_voted character.id
      )
    , 1000)

    @set 'characters', characters