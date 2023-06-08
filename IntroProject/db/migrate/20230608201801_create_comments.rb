class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body, index: {unique: true}, null: false
      t.references :author, foreign_key: {to_table: :users}, null: false
      t.references :artwork, foreign_key: {to_table: :artworks}, null: false
      t.timestamps
    end
  end
end
