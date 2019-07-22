class PortfolioItem < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # This way is valid, but not preferred:
  def self.angular
    where(subtitle: "AngularJS")
  end

  # The preferred way:
  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

end
