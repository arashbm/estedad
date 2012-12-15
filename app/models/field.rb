class Field < ActiveRecord::Base
  belongs_to :form
  attr_accessible :data, :description, :name, :type

  store :data

  validates :type, presence: true, inclusion: { in: Rails.configuration.field_types.keys }

  def self.inheritance_column
    :inh_type
  end

  def field_type
    Rails.configuration.field_types[type.to_s]
  end

  def input_type
    field_type['as'].to_sym
  end

  def visible_options
    field_type['options']
  end

  def option(name)
    name=name.to_s
    data[name.to_sym] || field_type['default'][name]
  end

  def validations
    if field_type['validations'].kind_of?(Array)
      field_type['validations']
    else
      [field_type['validations']]
    end
  end
end
