require "open-uri"

class Stamp < ApplicationRecord

  belongs_to :category

  

  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["avatar/jpg", "avatar/jpeg", "avatar/png", "avatar/gif"]

  def picture_from_url
    self.avatar = open("http://stamperija.eu/media/catalog/product/cache/1/image/940x500/17f82f742ffe127f42dca9de82fb58b1/N/I/NIG16601a_1.jpg").read
    self.save
  end


end