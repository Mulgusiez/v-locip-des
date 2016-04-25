class Annonce < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :route_changed?

  def address
    "#{street_number} #{route}, #{postal_code}, #{locality}, #{administrative_area_level_1}, #{country}"
  end
end
