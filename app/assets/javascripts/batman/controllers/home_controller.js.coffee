class Beyonceorrihanna.HomeController extends Batman.Controller
  index: ->
    Beyonceorrihanna.Character.load (err) -> throw err if err

    # We only get first rivalry!
    @set 'characters', Beyonceorrihanna.Character.get('all').indexedBy('rivalry_id').get(1)