module Contexts
  module ItemTagContexts
    def create_item_tags
      @item_tag1a = FactoryGirl.creat(:item_tag, item: @item1, tag: @tag1)
      @item_tag1b = FactoryGirl.creat(:item_tag, item: @item1, tag: @tag2)
      @item_tag2a = FactoryGirl.creat(:item_tag, item: @item2, tag: @tag1)
      @item_tag3a = FactoryGirl.creat(:item_tag, item: @item3, tag: @tag3)
    end

    def delete_item_tags
      @item_tag1a.delete
      @item_tag1b.delete
      @item_tag2a.delete
      @item_tag3a.delete
    end
  end
end
