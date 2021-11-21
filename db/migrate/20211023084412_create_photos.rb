class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :customer_id
      t.string :image_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :introduction,   null: false, default: "未入力"
      t.timestamps
    end
  end
end
