require 'test_helper'

class BidTest < ActiveSupport::TestCase
  should belong_to(:item)

  # All fields are mandatory
  should validate_presence_of(:ticket_num)
  should validate_presence_of(:amount)
  should validate_presence_of(:bid_time)
  should validate_presence_of(:amount)

  # Ticket should be a unique number
  should validate_uniqueness_of(:ticket_num)
  should validate_numericality_of(:ticket_num)
  should allow_value("1630").for(:number)
  should allow_value("1776").for(:number)
  should allow_value("2013").for(:number)
  should allow_value("2525").for(:number)
  should_not allow_value("bad").for(:number)
  should_not allow_value("1630.5").for(:number)
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

  context "Creating participants and them in the bowling queue, " do
    setup do
    end

    teardown do
    end

    should "not allow a new bid for less than current bid plus min_bid" do
      # bad_bid = FactoryGirl.build(:bid, ticket_number: )
    end
  end
end
