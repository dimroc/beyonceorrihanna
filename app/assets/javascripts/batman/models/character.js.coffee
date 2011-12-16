#= require batman/models/model

class Beyonceorrihanna.Character extends Beyonceorrihanna.Model
  @storageKey: 'characters'
  @primaryKey: 'slug'
  @encode 'id', 'name', 'slug', 'caption', 'image_url', 'twitter_tags', 'youtube_id'
  @persist Batman.RailsStorage