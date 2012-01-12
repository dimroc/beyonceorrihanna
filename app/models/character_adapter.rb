class CharacterAdapter < RivalryCharacter
  delegate :id, :name, :slug, :caption, :image_url, :twitter_tags, :youtube_id, prefix: true, to: :character

  def to_json(options = {})
    character_hash = JSON.parse(character.to_json)
    character_hash = Hash[character_hash.map { |k, v| ["character_" + k, v] }]

    rivalry_hash = JSON.parse(rivalry.to_json)
    rivalry_hash = Hash[rivalry_hash.map { |k, v| ["rivalry_" + k, v] }]
    character_hash.merge(rivalry_hash).merge({id: id, votes_count: votes_count}).to_json
  end
end
