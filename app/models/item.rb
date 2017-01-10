class Item < ApplicationRecord
  # Direct associations

  has_many   :productitems,
             :dependent => :destroy

  has_many   :itemphotos,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
