class Blog < ApplicationRecord

  enum status: {draft: 0, published: 1}
  
  # This is mixing in the FriendlyId class so that this model has access to its methods
  # (as class methods - they would be instance methods if 'include' was used
  # instead of 'extend')
  extend FriendlyId

  # friendly_id takes Blog's title field and generates a slug from it
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body
end
