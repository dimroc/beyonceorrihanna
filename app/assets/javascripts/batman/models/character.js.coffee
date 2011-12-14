#= require batman/models/model

class Beyonceorrihanna.Character extends Beyonceorrihanna.Model
  @storageKey: 'characters'
  @encode 'id', 'name', 'caption', 'image_url', 'twitter_tags', 'youtube_id'
  @persist Batman.RailsStorage

#
#  @access 'twitter_tag_list', -> (@get 'twitter_tags').split(',')

#      t.string   "name",         :null => false
#          t.datetime "created_at"
#          t.datetime "updated_at"
#          t.string   "slug"
#          t.text     "caption"
#          t.string   "image_url"
#          t.string   "twitter_tags"
#          t.string   "youtube_id"
#