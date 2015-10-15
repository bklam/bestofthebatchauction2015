module Contexts
  module ItemContexts
    def create_items
      @item1 = FactoryGirl.create(:item,
        name: "Signed #43 Jersey",
        description: "Official signed jersey of #43 Troy Polamalu",
        donated_by: "Pittsburgh Steelers",
        value: 300,
        starting_price: 200,
        current_price: 200,
        min_increment: 20,
        status_id: 0)
      @item2 = FactoryGirl.create(:item,
        name: "Valuable Item",
        description: "A valuable item coveted by many",
        donated_by: "Gracious Donor",
        value: 100,
        starting_price: 80,
        current_price: 80,
        min_increment: 10,
        status_id: 0)
    end

    def delete_items
    end
  end
end
