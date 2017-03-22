class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :stamps, :stamo_country, :stamp_country
  end
end
