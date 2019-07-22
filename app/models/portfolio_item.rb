class PortfolioItem < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # This way is valid, but not preferred:
  def self.angular
    where(subtitle: "AngularJS")
  end

  # The preferred way:
  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/350x200"
  end
end
