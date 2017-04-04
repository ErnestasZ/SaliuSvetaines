require "open-uri"
# require 'fileutils'

class Stamp < ApplicationRecord

  belongs_to :category

  
  def pictures_from_url(url)
    name = "#{self.stamperija_code}.#{self.image.split('.').last}"
    open("app/assets/images/#{name}", 'wb') do |file|
      file << open(url).read
      self.update(image_name: name)
    end

  end




end