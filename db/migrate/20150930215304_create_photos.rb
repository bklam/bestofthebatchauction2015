class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :item_id
      t.string :filename
      t.string :mime_type
      t.binary :file_contents

      t.timestamps null: false
    end
  end
end
