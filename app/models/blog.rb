class Blog < ApplicationRecord
  
  # This is mixing in the FriendlyId class so that this model has access to its methods
  # (as class methods - they would be instance methods if 'include' was used
  # instead of 'extend')
  extend FriendlyId

  # friendly_id takes Blog's title field and generates a slug from it
  friendly_id :title, use: :slugged
end
