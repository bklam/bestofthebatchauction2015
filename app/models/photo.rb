class Photo < ActiveRecord::Base
  ##### for future use, if we want to add multiple photos per item #####
  
  # Relationships
  belongs_to :item

  # Validations

  # Scopes

  # only store the path/filename?

  # item number was the filename

end
