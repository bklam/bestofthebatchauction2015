class User < ActiveRecord::Base
  
  # Relationships
  has_many :bids
  has_many :items, through: :bids

  # Validations

  # Scopes

end
