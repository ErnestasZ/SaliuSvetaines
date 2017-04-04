class AddImageNameToStamps < ActiveRecord::Migration[5.0]
  def change
    add_column :stamps, :image_name, :string
  end
end
