class Tag < ActiveRecord::Base
  
  # Relationships
  has_many :item_tags
  has_many :items, through: :item_tags

  # Validations

  # Scopes

end
