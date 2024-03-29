window.Beyonceorrihanna = class Beyonceorrihanna extends Batman.App
  Batman.View::prefix = 'assets/batman/views'

  @resources 'characters'
  @root 'home#index'

  @on 'run', ->
    console?.log "Running ...."

  @on 'ready', ->
    console?.log "Beyonceorrihanna ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message
