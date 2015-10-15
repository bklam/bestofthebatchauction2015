module Contexts
  module StatusContexts
    def create_statuses
      @available = FactoryGirl.create(:status, status_type: "Available", description: "Item is open to receive bids")
      @featured = FactoryGirl.create(:status, status_type: "Featured", description: "Item is open to receive bids and receives special advertising to attract more bidders")
      @sold = FactoryGirl.create(:status, status_type: "Sold", description: "Item has been claimed and no longer available")
      @missing = FactoryGirl.create(:status, status_type: "Missing", description: "Ahh! Where did it go??!")
      @paid = FactoryGirl.create(:status, status_type: "Paid", description: "Money - new car, caviar, four star daydream, Think I'll buy me a football team")
      @picked_up = FactoryGirl.create(:status, status_type: "Picked Up", description: "The claiming bidder has received the item")
    end

    def delete_statuses
      @available.delete
      @featured.delete
      @sold.delete
      @missing.delete
      @paid.delete
      @picked_up.delete
    end
  end
end
