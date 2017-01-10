class Productitem < ApplicationRecord
  # Direct associations

  belongs_to :item

  belongs_to :cart

  # Indirect associations

  # Validations

end
