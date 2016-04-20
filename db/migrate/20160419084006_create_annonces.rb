class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|
      t.string :title
      t.string :street_number
      t.string :route
      t.string :locality
      t.string :administrative_area_level_1
      t.string :postal_code
      t.string :country
      t.integer :price
      t.string :photo
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
