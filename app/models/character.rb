class Character < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  YOUTUBE_FORMAT = "http://www.youtube.com/v/%s?enablejsapi=1&amp;version=3&amp;border=0"

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_format_of :image_url,
    with: Regexp.union(/^$/, %r{\b(([\w-]+://?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/)))})

  def twitter_tag_list
    return twitter_tags.split(",").compact.map(&:strip) if twitter_tags.present?
    []
  end

  def youtube_url
    return YOUTUBE_FORMAT % youtube_id if youtube_id.present?
  end
end
