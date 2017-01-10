class Cart < ApplicationRecord
  # Direct associations

  has_many   :productitems,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
