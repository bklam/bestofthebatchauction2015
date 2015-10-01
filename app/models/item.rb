class Item < ActiveRecord::Base

  # Relationships
  has_many :bids # should this have many users through bids? i don't think so...
  has_many :item_tags
  has_many :tags, through: :item_tags
  has_many :photos
  belongs_to :status

  # Validations

  # need to make sure current_bid is the same as the max bid for the item

  # Scopes

end
