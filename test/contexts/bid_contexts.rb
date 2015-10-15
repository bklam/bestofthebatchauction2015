module Contexts
  module BidContexts
    def create_bids
      @bid1a = FactoryGirl.create(:bid, ticket_num: 1, item: @item1, amount: 200, bid_time: 2.minutes.ago.to_date)
      @bid1b = FactoryGirl.create(:bid, ticket_num: 2, item: @item1, amount: 250, bid_time: 1.minute.ago.to_date)
      @bid2a = FactoryGirl.create(:bid, ticket_num: 3, item: @item2, amount: 90,  bid_time: 10.minutes.ago.to_date)
      @bid2b = FactoryGirl.create(:bid, ticket_num: 1, item: @item2, amount: 130, bid_time: 6.minutes.ago.to_date)
      @bid2c = FactoryGirl.create(:bid, ticket_num: 3, item: @item2, amount: 140, bid_time: DateTime.now)
      @bid3a = FactoryGirl.create(:bid, ticket_num: 2, item: @item3, amount: 40,  bid_time: 8.minutes.ago.to_date)
      @bid3b = FactoryGirl.create(:bid, ticket_num: 1, item: @item3, amount: 50,  bid_time: 4.minutes.ago.to_date)
    end

    def delete_bids
      @bid1a.delete
      @bid1b.delete
      @bid1c.delete
    end
  end
end
