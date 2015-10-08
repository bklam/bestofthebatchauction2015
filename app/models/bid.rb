class Bid < ActiveRecord::Base

  # Relationships
  belongs_to :user
  belongs_to :item

  # Validations

  # need validations to make sure bids are valid

  # just be sure that it's greater than the highest bid by min_increment 
  # (worry about multiple of min_increment later if needed)

  # Scopes

  # all bids are whole numbers, just integers. makes my life easier

  # replace user_id with ticket_number


end
