class Order < ApplicationRecord
  # Direct associations

  has_many   :productitems,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
