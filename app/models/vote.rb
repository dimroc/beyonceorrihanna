class Vote < ActiveRecord::Base
  belongs_to :entry, counter_cache: :votes_count
  has_one :rivalry, through: :entry

  validates :entry_id, presence: true
  validates :ip, presence: true, uniqueness: { scope: :entry_id }
  validate :ensure_unique_ip_per_rivalry

  private

  def ensure_unique_ip_per_rivalry
    if rivalry.present? && rivalry.votes.find_by_ip(ip)
      errors.add(:ensure_unique_ip_per_rivalry, "#{ip} has already voted for this rivalry")
    end
  end
end
