class Itemphoto < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :item

  # Indirect associations

  # Validations

end
