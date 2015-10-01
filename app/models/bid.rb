class Bid < ActiveRecord::Base

  # Relationships
  belongs_to :user
  belongs_to :item

  # Validations

  # need validations to make sure bids are valid

  # Scopes


end
