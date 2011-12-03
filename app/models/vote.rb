class Vote < ActiveRecord::Base
  IP_REGEX = Regexp.union(["0.0.0.0", /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/])

  belongs_to :rivalry_character, counter_cache: :votes_count
  has_one :rivalry, through: :rivalry_character

  validates :rivalry_character_id, presence: true
  validates :ip,
            presence: true,
            uniqueness: {scope: :rivalry_character_id},
            format: {with: IP_REGEX}

  validate :ensure_unique_ip_per_rivalry

  private

  def ensure_unique_ip_per_rivalry
    if rivalry.present? && rivalry.votes.find_by_ip(ip)
      errors.add(:ensure_unique_ip_per_rivalry, "#{ip} has already voted for this rivalry")
    end
  end
end
