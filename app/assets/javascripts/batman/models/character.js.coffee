#= require batman/models/model

class Beyonceorrihanna.Character extends Beyonceorrihanna.Model
  @storageKey: 'characters'
  @encode 'id',
      'character_id',
      'character_name',
      'character_slug',
      'character_caption',
      'character_image_url',
      'character_twitter_tags',
      'character_youtube_id',
      'rivalry_id'

  @persist Batman.RailsStorage
  @url = "/api/character_adapters"

  @accessor 'youtube_url'
    get: ->
      youtube_url = "http://www.youtube.com/v/" + @get('character_youtube_id') + "?enablejsapi=1&amp;version=3&amp;border=0"

  @accessor 'twitter_tag_list'
    get: ->
      @get('character_twitter_tags')?.split(",")

  @accessor 'tweets'
      get: ->
        @tweets ||= @refreshTweets()
        @set('twitter_followers_count', _.first(@tweets.toArray()).user.followers_count) if @tweets && !@tweets.isEmpty()
        @tweets

  @accessor 'twitter_followers_count'
    get: -> @twitter_followers_count
    set: (k, v) -> @twitter_followers_count = v

  refreshTweets: () ->
    if(@get('character_twitter_tags') == null)
      return

    TWITTER_API = "http://api.twitter.com/1/statuses/user_timeline.json?callback=?&screen_name={0}&count=10";
    tweets = new Batman.Set()
    @get('twitter_tag_list').forEach (tag) ->
      twitter_url = TWITTER_API.replace("{0}", tag)

      $.getJSON twitter_url, (data) ->
        if(data && !_.isEmpty(data))
          data?.forEach (entry) ->
            tweets.add(entry)

    tweets