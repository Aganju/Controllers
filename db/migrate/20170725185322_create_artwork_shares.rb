class CreateArtworkShares < ActiveRecord::Migration[5.0]
  def change
    create_table :artwork_shares do |t|
      t.string :artwork_id, null: false
      t.string :viewer_id, null: false
    end
    add_index :artwork_shares, :viewer_id
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
  end
end
