class FilledField < ActiveRecord::Base
  belongs_to :field
  belongs_to :filled_form

  attr_accessible :value
  attr_accessible :value, as: :admin
end
