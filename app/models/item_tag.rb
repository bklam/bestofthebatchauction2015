class ItemTag < ActiveRecord::Base

  # Relationships
  belongs_to :item
  belongs_to :tag

  # Validations

  # Scopes

end
