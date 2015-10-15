module Contexts
  module BidContexts
    def create_bids
      @bid1a = FactoryGirl.create(:bid, ticket_num: 1, item: @item1, amount: 50.00, bid_time: 2.minutes.ago.to_date)
      @bid1b = FactoryGirl.create(:bid, ticket_num: 2, @jane, item: @item1, amount: 100.00, bid_time: 1.minute.ago.to_date)
      @bid1c = FactoryGirl.create(:bid, ticket_num: 3, item: @item1, amount: 180.00, bid_time: DateTime.now)
    end

    def delete_bids
      @bid1a.delete
      @bid1b.delete
      @bid1c.delete
    end
  end
end
