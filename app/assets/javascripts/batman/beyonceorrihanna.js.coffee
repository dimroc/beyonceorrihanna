window.Beyonceorrihanna = class Beyonceorrihanna extends Batman.App

  @root 'characters#index'
#  @route '/controller/:id', 'controller#show', resource: 'model', action: 'show'
  @resources 'characters'

  @on 'run', ->
    console?.log "Running ...."

  @on 'ready', ->
    console?.log "Beyonceorrihanna ready for use."

#  @flash: Batman()
#  @flash.accessor
#    get: (key) -> @[key]
#    set: (key, value) ->
#      @[key] = value
#      if value isnt ''
#        setTimeout =>
#          @set(key, '')
#        , 2000
#      value
#
#  @flashSuccess: (message) -> @set 'flash.success', message
#  @flashError: (message) ->  @set 'flash.error', message
