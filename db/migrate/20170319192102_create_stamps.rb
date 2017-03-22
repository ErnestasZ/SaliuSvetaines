class CreateStamps < ActiveRecord::Migration[5.0]
  def change
    create_table :stamps do |t|
      t.string :_type
      t.string :image
      t.string :name
      t.string :short_description
      t.string :stamperija_code
      t.string :stamp_continent
      t.string :stamo_country
      t.string :stamp_group
      t.string :stamp_group1
      t.string :stamp_group2
      t.string :stamp_group3
      t.string :stamp_year
      t.references :category, foreign_key: true
    end
  end
end
