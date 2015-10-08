class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :donated_by
      t.integer :value
      t.decimal :starting_price, precision: 8, scale: 2
      t.decimal :current_price, precision: 8, scale: 2
      t.decimal :min_increment, precision: 8, scale: 2
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
