class ModifyArtworkSharesColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :artwork_shares, :artwork_id, 'integer USING CAST(artwork_id AS integer)'
    change_column :artwork_shares, :viewer_id, 'integer USING CAST(viewer_id AS integer)'

  end
end
