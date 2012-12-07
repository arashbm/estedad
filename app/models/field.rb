class Field < ActiveRecord::Base
  belongs_to :form
  attr_accessible :data, :description, :name, :type

  def self.inheritance_column
    :inh_type
  end
end
