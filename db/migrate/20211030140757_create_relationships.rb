class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key: { to_table: :customers }#foreign_key: trueから変更
      t.references :following, foreign_key:{ to_table: :customers }

      t.timestamps
    end
    add_index :relationships, [:follower_id, :following_id], unique: true#「unique: true」で同じ組み合わせでデータを保存するのを防ぐ
  end
end
