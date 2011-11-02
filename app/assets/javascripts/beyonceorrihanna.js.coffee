window.Beyonceorrihanna = class Beyonceorrihanna extends Batman.App

  # @root 'controller#all'
  # @route '/controller/:id', 'controller#show', resource: 'model', action: 'show'

  @run ->
    console.log "Running..."
    true

  @ready ->
    console.log "Beyonceorrihanna ready for use."

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
