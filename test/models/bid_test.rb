require 'test_helper'

class BidTest < ActiveSupport::TestCase
  should belong_to(:item)
  should belong_to(:user)

  should validate_presence_of(:user_id)
  should validate_numericality_of(:user_id)
  should_not allow_value(nil).for(:user_id)

  should validate_presence_of(:amount)
  should validate_numericality_of(:amount)
  should_not allow_value(:nil).for(:amount)
  should_not allow_value(0).for(:amount)
  should_not allow_value(-1).for(:amount)
  should allow_value(15.59).for(:amount)

  # should validate_presence_of(:bid_time)
  should allow_value(DateTime.now).for(:bid_time)
  should allow_value(1.day.ago.to_date).for(:bid_time)
  should_not allow_value(1.minute.from_now.to_date).for(:bid_time)
  should_not allow_value("bad").for(:bid_time)
  should_not allow_value(2).for(:bid_time)
  should_not allow_value(3.14159).for(:bid_time)

  context "Creating participants and them in the bowling queue, " do
    setup do
      create_bowling_queues_context
    end

    teardown do
      remove_bowling_queues_context
    end

    should "return participants in order by position" do
      assert_equal ["James", "Zach", "Alex", "Mike"], BowlingQueue.by_position.map { |bq| bq.participant.first_name }
    end
  end
end
