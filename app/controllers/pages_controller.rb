class PagesController < ApplicationController
  def index
    @categories = Category.order('release_date DESC, created_at DESC')
    @stamps = Stamp.all
    year = []
    @categories.each do |category|
      year << category.release_date.year
    end
    @years = year.uniq
  end

  def categories

  end

  def stamps
    @category = Category.find(params[:id])
  end

  def import_csv_stamperija
    Category.import_csv_stamperija(params[:file])
    redirect_to categories_path
  end

  def stamp
    @stamp = Stamp.first.picture_from_url
  end
end
