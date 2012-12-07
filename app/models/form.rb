class Form < ActiveRecord::Base
  has_many :fields, order: :position
  attr_accessible :description, :enabled, :title
end
