require './test/contexts/bid_contexts'
require './test/contexts/item_contexts'
require './test/contexts/item_tag_contexts'
require './test/contexts/photo_contexts'
require './test/contexts/status_contexts'
require './test/contexts/tag_contexts'
require './test/contexts/user_contexts'

module Contexts
  include Contexts::BidContexts
  include Contexts::ItemContexts
  include Contexts::ItemTagContexts
  include Contexts::PhotoContexts
  include Contexts::StatusContexts
  include Contexts::TagContexts
  include Contexts::UserContexts
end
