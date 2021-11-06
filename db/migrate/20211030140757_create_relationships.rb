class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key: { to_table: :customers }#foreign_key: trueから変更
      t.references :following, foreign_key:{ to_table: :customers }

      t.timestamps
    end

  end
end
