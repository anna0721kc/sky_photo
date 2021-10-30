class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :customer_id,              null: false, default: ""
      t.string :image_id,              null: false, default: ""
      t.string :address,              null: false, default: ""
      t.integer :latitude,              null: false, default: ""
      t.integer :longitude,              null: false, default: ""
      t.text :introduction,              null: false, default: ""
      t.timestamps
    end
  end
end
