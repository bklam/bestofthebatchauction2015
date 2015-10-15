require 'test_helper'

class BidTest < ActiveSupport::TestCase
  should belong_to(:item)

  # All fields are mandatory
  should validate_presence_of(:ticket_num)
  should validate_presence_of(:amount)
  should validate_presence_of(:bid_time)
  should validate_presence_of(:amount)

  # Ticket should be a unique number
  should validate_numericality_of(:ticket_num)
  should allow_value("1630").for(:ticket_num)
  should allow_value("1776").for(:ticket_num)
  should allow_value("2013").for(:ticket_num)
  should allow_value("2525").for(:ticket_num)
  should_not allow_value("bad").for(:ticket_num)
  should_not allow_value("1630.5").for(:ticket_num)
  # Test boundaries?
  # should_not allow_value("1599").for(:number)
  # should_not allow_value("2600").for(:number)

  # Amount must be a positive integer (make it easy on us)
  should validate_numericality_of(:amount)
  should allow_value(50).for(:amount)
  should_not allow_value(:nil).for(:amount)
  should_not allow_value(0).for(:amount)
  should_not allow_value(-1).for(:amount)
  should_not allow_value(15.59).for(:amount)

  # Bid Time should be <= right now (bids can't be made in the future)
  #Skylar was here
  should allow_value(DateTime.now).for(:bid_time)
  should allow_value(1.day.ago.to_date).for(:bid_time)
  should_not allow_value(1.minute.from_now.to_date).for(:bid_time)
  should_not allow_value("bad").for(:bid_time)
  should_not allow_value(2).for(:bid_time)
  should_not allow_value(3.14159).for(:bid_time)

  context "Bids" do
    setup do
      create_statuses
      create_items
      create_bids
    end

    teardown do
      delete_bids
      delete_items
      delete_statuses
    end

    should "not allow a new bid for less than starting_price" do
      bad_bid = FactoryGirl.build(:bid, ticket_num: 5, item: @item3, amount: 39, bid_time: DateTime.now)
      deny bad_bid.valid?
    end

    should "not allow bids that are less than current_price + min_increment" do
      bad_bid1 = FactoryGirl.build(:bid, ticket_num: 5, item: @item1, amount: 249, bid_time: DateTime.now)
      bad_bid2 = FactoryGirl.build(:bid, ticket_num: 5, item: @item1, amount: 250, bid_time: DateTime.now)
      bad_bid3 = FactoryGirl.build(:bid, ticket_num: 5, item: @item1, amount: 269, bid_time: DateTime.now)
      deny bad_bid1.valid?
      deny bad_bid2.valid?
      deny bad_bid3.valid?
    end

    should "allow bids that are greater than current_price + min_increment" do
      bid1 = FactoryGirl.build(:bid, ticket_num: 5, item: @item1, amount: 270, bid_time: DateTime.now)
      bid2 = FactoryGirl.build(:bid, ticket_num: 5, item: @item1, amount: 300, bid_time: DateTime.now)
      assert bid1.valid?
      assert bid2.valid?
    end

    should "not allow bids for an item that is not for sale" do
      bad_bid1 = FactoryGirl.build(:bid, ticket_num: 5, item: @item1_picked_up, amount; 270, bid_time: DateTime.now)
      bad_bid2 = FactoryGirl.build(:bid, ticket_num: 5, item: @item1_missing, amount; 270, bid_time: DateTime.now)
      bad_bid3 = FactoryGirl.build(:bid, ticket_num: 5, item: @item2_paid, amount; 150, bid_time: DateTime.now)
      bad_bid4 = FactoryGirl.build(:bid, ticket_num: 5, item: @item3_sold, amount; 100, bid_time: DateTime.now)
      deny bad_bid1.valid?
      deny bad_bid2.valid?
      deny bad_bid3.valid?
      deny bad_bid4.valid?
    end
  end
end
