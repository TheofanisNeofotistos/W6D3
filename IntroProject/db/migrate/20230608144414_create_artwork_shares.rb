class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, foreign_key: { to_table: :artworks}, index: true, null: false 
      t.references :viewer, foreign_key: { to_table: :users }, index: true, null: false 

      t.timestamps
    end
  end
end
