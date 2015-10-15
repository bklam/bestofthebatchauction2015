module Contexts
  module TagContexts
    def create_tags
      @tag1 = FactoryGirl.create(:tag, name: "Steelers")
      @tag1 = FactoryGirl.create(:tag, name: "Travel")
      @tag1 = FactoryGirl.create(:tag, name: "Food & Drink")
    end

    def delete_tags
      @tag1.delete
      @tag2.delete
      @tag3.delete
    end
  end
end
