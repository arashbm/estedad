class Form < ActiveRecord::Base
  has_many :fields, order: :position
  has_many :filled_forms
  attr_accessible :description, :enabled, :title
end
