class Character < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_format_of :image_url,
    with: Regexp.union(/^$/, %r{\b(([\w-]+://?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/)))})

  validates_format_of :youtube_url,
    with: Regexp.union(/^$/, %r{\b(([\w-]+://?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/)))})

  def twitter_tag_list
    return twitter_tags.split(",").compact.map(&:strip) if twitter_tags.present?
    []
  end
end
