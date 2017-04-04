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
    
    categories_arr = []
    selected_rows.each do |row|
      categories_arr << row['_category']
    end

    categories_arr.uniq!
    
    selected_category = []
    categories_arr.each do |category|
      arr_cat = []
      selected_rows.each do |row|
        if category == row['_category']
          arr_cat << row
        end
      end
      selected_category << arr_cat
    end


    selected_category.each do |cat|
      Category.create! [name: cat[1][4], 
                        date_issue: cat[1][4].scan(/\d+/).first(3).join(' '), 
                        release_date: (cat[1][4].scan(/\d+/).first(3).join('-')).to_date]
      
      cat.each do |row|
        arr = []
        Stamp.column_names.reject {|cc| cc == 'id' || cc == 'created_at' || cc == 'category_id'}.each do |col|
          arr << row[col]
        end
        stamp = Category.last.stamps
        stamp.create! [_type: arr[0], image: arr[1], name: arr[2], short_description: arr[3],
                                      stamperija_code: arr[4], stamp_continent: arr[5], stamp_country: arr[6],
                                      stamp_group: arr[7], stamp_group1: arr[8], stamp_group2: arr[9], stamp_group3: arr[10],
                                      stamp_year: arr[11]]
        stamp.last.pictures_from_url(stamp.last.image)                                
      end
    end

  end



  def all_years
    @years = Category.select(:release_date)
  end

end