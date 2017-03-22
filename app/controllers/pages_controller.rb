class PagesController < ApplicationController
  def index
  end

  def categories

  end

  def import_csv_stamperija
    Category.import_csv_stamperija(params[:file])
    redirect_to categories_path
  end
end
