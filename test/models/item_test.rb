require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should belong_to(:status)

  should validate_presence_of(:name)
  should validate_presence_of(:description)
  should validate_presence_of(:donated_by)
  should validate_presence_of(:value)
  should validate_presence_of(:starting_price)
  should validate_presence_of(:min_increment)

  should_not allow_value(" ").for(:donated_by)
  should_not allow_value(nil).for(:donated_by)

  should validate_numericality_of(:value)
  should allow_value(100).for(:value)
  should allow_value(1).for(:value)
  should_not allow_value(0).for(:value)
  should_not allow_value(-1).for(:value)
  should_not allow_value(5.19).for(:value)
  should_not allow_value("bad").for(:value)
  should_not allow_value(nil).for(:value)

  should validate_numericality_of(:starting_price)
  should allow_value(100).for(:starting_price)
  should allow_value(1).for(:starting_price)
  should_not allow_value(0).for(:starting_price)
  should_not allow_value(-1).for(:starting_price)
  should_not allow_value(5.19).for(:starting_price)
  should_not allow_value("bad").for(:starting_price)
  should_not allow_value(nil).for(:starting_price)

  should validate_numericality_of(:current_price)
  should allow_value(100).for(:current_price)
  should allow_value(1).for(:current_price)
  should_not allow_value(0).for(:current_price)
  should_not allow_value(-1).for(:current_price)
  should_not allow_value(5.19).for(:current_price)
  should_not allow_value("bad").for(:current_price)
  should_not allow_value(nil).for(:current_price)

  should validate_numericality_of(:min_increment)
  should allow_value(100).for(:min_increment)
  should allow_value(1).for(:min_increment)
  should_not allow_value(0).for(:min_increment)
  should_not allow_value(-1).for(:min_increment)
  should_not allow_value(5.19).for(:min_increment)
  should_not allow_value("bad").for(:min_increment)
  should_not allow_value(nil).for(:min_increment)

  should validate_numericality_of(:status_id)
  should_not allow_value(nil).for(:status_id)
  should_not allow_value("").for(:status_id)
  should_not allow_value("bad").for(:status_id)

  context "Items" do
    setup do
      create_statuses
      create_items
    end

    teardown do
      delete_items
      delete_statuses
    end

    should "set current_price to starting_price upon creation" do
      item = FactoryGirl.create(:item,
        name: "new item",
        description: "nothing to see here",
        value: 100,
        starting_price: 80,
        min_increment: 10,
        status_id: @featured)
      assert_equal item.current_price, item.starting_price
    end

    # Require donated_by for now so no mistakes are made...
    # should "set donated_by to 'Anonymous' if unspecified" do
    #   assert_equal @item3.donated_by, "Anonymous"
    # end

    should "have a scope to order alphabetically by name" do
      assert_same_elements Item.alphabetical.limit(3), [@item1, @item2, @item3]
    end

    # should "have a scope to order by current price" do
    #   assert_same_elements Item.by_current_price.limit(3),
    # end

    # should "have a scope to order by item value" do
    # end

    should "have a scope for items open to bidding" do
      assert_same_elements Item.biddable, [@item1, @item2, @item2_featured, @item3, @item3_featured]
    end

    should "have a scope for featured items" do
      assert_same_elements Item.featured, [@item2_featured, @item3_featured]
    end

    should "have a scope for items not biddable" do
      assert_same_elements Item.not_biddable, [@item1_picked_up, @item1_missing, @item2_paid, @item3_sold]
    end

    should "have a scope for items sold" do
      assert_same_elements Item.sold, [@item1_picked_up, @item2_paid, @item3_sold]
    end
  end
end
