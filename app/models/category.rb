class Category < ApplicationRecord
  require 'csv'
  has_many :stamps


  def self.import_csv_stamperija(file)
    selected_rows = []
    CSV.foreach(file.path, col_sep: ",", headers: true) do |row|
      if row['_type'] == "grouped"
        row['image'].insert(0, 'http://stamperija.eu/media/catalog/product/cache/1/image/940x500/17f82f742ffe127f42dca9de82fb58b1')
        selected_rows << row
      end
    end

    Category.create! [name: selected_rows[1][4], date_issue: selected_rows[1][4].scan(/\d+/).first(3).join(' ')]
    
    selected_rows.each do |row|
      arr = []
      Stamp.column_names.reject {|cc| cc == 'id' || cc == 'created_at' || cc == 'category_id'}.each do |col|
        arr << row[col]
      end
      Category.last.stamps.create! [_type: arr[0], image: arr[1], name: arr[2], short_description: arr[3],
                                    stamperija_code: arr[4], stamp_continent: arr[5], stamp_country: arr[6],
                                    stamp_group: arr[7], stamp_group1: arr[8], stamp_group2: arr[9], stamp_group3: arr[10],
                                    stamp_year: arr[11]]
    end

  end

end