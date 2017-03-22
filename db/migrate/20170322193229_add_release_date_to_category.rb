class AddReleaseDateToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :release_date, :datetime
  end
end
