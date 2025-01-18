# app/models/url.rb
class Url < ApplicationRecord
  before_validation :generate_short_code, on: :create

  validates :original_url, presence: true, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/, message: "is not a valid URL" }

  # Tracking visits
  has_many :analytics, dependent: :destroy

  private

  def generate_short_code
    self.short_code ||= SecureRandom.hex(3) # Generates a unique 6-character hex string
  end
end
