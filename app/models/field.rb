class Field < ActiveRecord::Base
  belongs_to :form
  attr_accessible :data, :description, :name, :type

  def self.inheritance_column
    :inh_type
  end

  def input_type
    # this should return correct input type for deffrent types
    :string
  end
end
