module Contexts
  module ItemContexts
    def create_items
      @item1 = FactoryGirl.create(:item,
        name: "aSigned #43 Jersey",
        description: "Official signed jersey of #43 Troy Polamalu",
        donated_by: "Pittsburgh Steelers",
        value: 300,
        starting_price: 200,
        min_increment: 20,
        status_id: @available)
      @item1_picked_up = FactoryGirl.create(:item,
        name: "Signed #43 Jersey",
        description: "Official signed jersey of #43 Troy Polamalu",
        donated_by: "Pittsburgh Steelers",
        value: 300,
        starting_price: 200,
        min_increment: 20,
        status_id: @picked_up)
      @item1_missing = FactoryGirl.create(:item,
        name: "Signed #43 Jersey",
        description: "Official signed jersey of #43 Troy Polamalu",
        donated_by: "Pittsburgh Steelers",
        value: 300,
        starting_price: 200,
        min_increment: 20,
        status_id: @missing)

      @item2 = FactoryGirl.create(:item,
        name: "aValuable Item",
        description: "A valuable item coveted by many",
        donated_by: "Gracious Donor",
        value: 100,
        starting_price: 80,
        min_increment: 10,
        status_id: @featured)
      @item2_paid = FactoryGirl.create(:item,
        name: "Valuable Item",
        description: "A valuable item coveted by many",
        donated_by: "Gracious Donor",
        value: 100,
        starting_price: 80,
        min_increment: 10,
        status_id: @paid)
      @item2_featured = FactoryGirl.create(:item,
        name: "Valuable Item",
        description: "A valuable item coveted by many",
        donated_by: "Gracious Donor",
        value: 100,
        starting_price: 80,
        min_increment: 10,
        status_id: @featured)

      @item3 = FactoryGirl.create(:item,
        name: "aGift Basket",
        description: "An assortment of neat doodads bundled together",
        value: 40,
        starting_price: 40,
        min_increment: 5,
        status: @available)
      @item3_featured = FactoryGirl.create(:item,
        name: "Gift Basket",
        description: "An assortment of neat doodads bundled together",
        value: 40,
        starting_price: 40,
        min_increment: 5,
        status: @featured)
      @item3_sold = FactoryGirl.create(:item,
        name: "Gift Basket",
        description: "An assortment of neat doodads bundled together",
        value: 40,
        starting_price: 40,
        min_increment: 5,
        status: @sold)
    end

    def delete_items
      @item1.delete
      @item2.delete
      @item3.delete
    end
  end
end
